import {
  BadRequestException,
  Controller,
  Get,
  InternalServerErrorException,
  Logger,
  Query,
  Response,
} from '@nestjs/common';
import { Oidc } from 'nest-oidc-provider';
import { ClientMetadata, KoaContextWithOIDC } from 'oidc-provider';
import { Response as Res } from 'express';
import axios from 'axios';
import { ConfigService } from '@nestjs/config';
import { AdditionalOIDCConfig } from './oidc/oidc.env-parse';
import qs from 'qs';

@Controller()
export class AppController {
  private readonly logger = new Logger(AppController.name);
  private readonly enableUi: boolean;
  private readonly location: string;

  private readonly client: ClientMetadata;

  constructor(config: ConfigService) {
    this.enableUi = config.get<boolean>('OIDC_INTERACTION_UI');
    this.client = config
      .get<AdditionalOIDCConfig>('oidcConfig')
      .clients.find((e) => e.client_id === 'apps');
    this.location = config.get<string>('location');
  }

  /**
   * Generic callback to get access to apps
   * @param query
   * @param res
   */
  @Get('/callback')
  async callback(@Query() query: Record<string, any>, @Response() res: Res) {
    const { code, error, error_description } = query;

    if (error) {
      return res.json({ error, error_description });
    }

    if (!code) {
      throw new BadRequestException('Missing "code" parameter');
    }

    try {
      const result = await axios.post(
        `${this.location}/oidc/token`,
        qs.stringify({
          client_id: this.client.client_id,
          grant_type: this.client.grant_types[0] ?? 'authorization_code',
          redirect_uri: this.client.redirect_uris[0],
          code,
        }),
        {
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        }
      );

      res.json(result.data);
    } catch (err) {
      this.logger.error('Could not get token:', err);

      throw new InternalServerErrorException(err.response?.data ?? err);
    }
  }

  @Get()
  async index(@Oidc.Context() ctx: KoaContextWithOIDC, @Response() res: Res) {
    const {
      oidc: { provider },
    } = ctx;
    const session = await provider.Session.get(ctx);

    if (session?.accountId) {
      const grant = await provider.Grant.find(session.grantIdFor('test_id'));
      return this.renderIfUiEnabled(
        res,
        {
          accountId: session.accountId,
          scopes: grant.getOIDCScopeEncountered(),
        },
        'index'
      );
    }

    return this.renderIfUiEnabled(
      res,
      {
        accountId: null,
        scopes: null,
      },
      'index'
    );
  }

  protected renderIfUiEnabled(res: Res, data: object, view: string) {
    if (this.enableUi === true) {
      return res.render(view, data);
    }

    return res.json(data);
  }
}
