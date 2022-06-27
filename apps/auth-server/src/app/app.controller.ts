import {
  BadRequestException,
  Controller,
  Get,
  InternalServerErrorException,
  Logger,
  Query,
  Response
} from '@nestjs/common';
import { Oidc } from "nest-oidc-provider";
import { KoaContextWithOIDC } from "oidc-provider";
import { Response as Res} from "express";
import axios from "axios";
import {ConfigService} from "@nestjs/config";

@Controller()
export class AppController {

  private readonly logger = new Logger(AppController.name)
  private readonly enableUi: boolean

  constructor(config: ConfigService) {
    this.enableUi = config.get<boolean>('OIDC_INTERACTION_UI')
  }

  /**
   * TODO use this to manage profile
   * @param query
   * @param res
   */
  @Get('/callback')
  async test(@Query() query: Record<string, any>, @Response() res: Res) {
    const { code, error, error_description } = query;

    if (error) {
      return res.json({ error, error_description })
    }

    if (!code) {
      throw new BadRequestException('Missing "code" parameter')
    }

    try {
      const result = await axios.post(
        'http://localhost:3333/oidc/token',
        {
          client_id: 'test_id',
          grant_type: 'authorization_code',
          redirect_uri: 'http://localhost:8082/login/oauth2/code/authserver',
          code,
        },
        {
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        },
      );

      console.log(result)

      res.redirect('/')
    } catch (err) {
      this.logger.error('Could not get token:', err);

      throw new InternalServerErrorException(err.response?.data ?? err)
    }
  }

  @Get()
  async index(
    @Oidc.Context() ctx: KoaContextWithOIDC,
    @Response() res: Res
  ) {
    const { oidc: { provider } } = ctx;
    const session = await provider.Session.get(ctx);

    if (session?.accountId) {
      const grant = await provider.Grant.find(session.grantIdFor('test_id'));
      return this.renderIfUiEnabled(res, {
        accountId: session.accountId,
        scopes: grant.getOIDCScopeEncountered()
      }, 'index')
    }

    return this.renderIfUiEnabled(res, {
      accountId: null,
      scopes: null
    }, 'index')
  }

  protected renderIfUiEnabled(res: Res, data: object, view: string) {
    if (this.enableUi === true) {
      return res.render(view, data)
    }

    return res.json(data)
  }
}
