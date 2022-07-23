import {
  BadRequestException,
  Body,
  Controller,
  Get,
  Logger,
  Param,
  Post,
  Res,
} from '@nestjs/common';
import { PromptDetail, Provider, UnknownObject } from 'oidc-provider';
import { Oidc, InteractionHelper } from 'nest-oidc-provider';
import { Response } from 'express';
import { isEmpty } from 'lodash';
import { UserService } from '../ldap/user.service';
import { ConfigService } from '@nestjs/config';
import { filterUndefinedInObj } from '../utils/object.utils';
import { ApiProperty } from '@nestjs/swagger';

type InteractionPayload = {
  prompt: PromptDetail;
  client: object;
  params: object;
  uid: string;
};

class LoginDto {
  @ApiProperty()
  email: string ;

  @ApiProperty()
  password: string ;
}

@Controller('/interaction')
export class InteractionController {
  private readonly logger = new Logger(InteractionController.name);
  private readonly enableUi: boolean;
  private readonly fullLocation: string;
  protected static readonly INTERACTION_TYPES = ['consent', 'login'];

  constructor(
    private readonly provider: Provider,
    private readonly userService: UserService,
    config: ConfigService
  ) {
    this.enableUi = config.get<boolean>('OIDC_INTERACTION_UI');
    this.fullLocation = config.get<string>('location');
  }

  @Get('/:uid')
  async login(
    @Param('uid') _: string,
    @Oidc.Interaction() interaction: InteractionHelper,
    @Res() res: Response
  ) {
    const { prompt, params, uid } = await interaction.details();
    this.checkPrompt(prompt.name);

    const client = await this.provider.Client.find(params.client_id as string);

    const interactionPayload: InteractionPayload = {
      prompt,
      client,
      params,
      uid,
    };

    if (this.enableUi === true) {
      return res.render(`${prompt.name}`, interactionPayload);
    }

    return this.hateosPrompt(res, interactionPayload);
  }

  @Post('/:uid')
  async loginCheck(
    @Param('uid') _: string,
    @Oidc.Interaction() interaction: InteractionHelper,
    @Body() { email, password }: LoginDto
  ) {
    const { prompt, params, uid } = await interaction.details();

    if (!email || !password)
      throw new BadRequestException('Missing login form data');

    this.checkPrompt(prompt.name);

    this.logger.debug(`Login UID: ${uid}`);
    this.logger.debug(`Login user: ${email}`);
    this.logger.debug(`Client ID: ${params.client_id}`);

    const user = await this.userService.login(email, password);

    if (isEmpty(user) || user.id == null)
      throw new BadRequestException('Unable to find user');

    await interaction.finished(
      {
        login: {
          accountId: String(user.id),
        },
        client: params.client_id,
        ...this.addAppRelativeParams(params),
      },
      { mergeWithLastSubmission: false }
    );
  }

  @Post(':uid/confirm')
  async confirmLogin(
    @Param('uid') _: string,
    @Oidc.Interaction() interaction: InteractionHelper
  ) {
    const interactionDetails = await interaction.details();
    const { prompt, params, session } = interactionDetails;

    if (prompt.name !== 'consent')
      throw new BadRequestException('Invalid prompt name');

    let { grantId } = interactionDetails;

    const grant = grantId
      ? await this.provider.Grant.find(grantId)
      : new this.provider.Grant({
          accountId: session.accountId,
          clientId: params.client_id as string,
        });

    if (prompt.details.missingOIDCScope) {
      const scopes = prompt.details.missingOIDCScope as string[];
      grant.addOIDCScope(scopes.join(' '));
    }

    if (prompt.details.missingOIDCClaims) {
      grant.addOIDCClaims(prompt.details.missingOIDCClaims as string[]);
    }

    if (prompt.details.missingResourceScopes) {
      for (const [indicator, scopes] of Object.entries(
        prompt.details.missingResourceScopes
      )) {
        grant.addResourceScope(
          indicator,
          ((scopes || []) as string[]).join(' ')
        );
      }
    }

    this.logger.log(
      `Processing ${grant.accountId} / rejection : ${grant.rejected}`
    );
    this.logger.log(`Oidc grant ${grant.openid.scope}`);
    this.logger.log(`Oidc claims ${grant.openid.claims}`);

    grantId = await grant.save();
    this.logger.log(`Granted ${session.uid}`);

    await interaction.finished(
      { consent: { grantId }, ...this.addAppRelativeParams(params) },
      { mergeWithLastSubmission: true }
    );
  }

  @Get(':uid/abort')
  async abortLogin(
    @Param('uid') _: string,
    @Oidc.Interaction() interaction: InteractionHelper
  ) {
    const result = {
      error: 'access_denied',
      error_description: 'End-user aborted interaction',
    };

    await interaction.finished(result, { mergeWithLastSubmission: false });
  }

  protected hateosPrompt(
    res: Response,
    { prompt, client, params, uid }: InteractionPayload
  ) {
    const interactionNavigation = {
      ...(prompt.name === 'consent'
        ? {
            confirm: this.getInteractionRoute(uid, 'confirm'),
            abort: this.getInteractionRoute(uid, 'abort'),
          }
        : {
            login: this.getInteractionRoute(uid),
          }),
    };

    res.json({
      prompt,
      client,
      params,
      uid,
      _links: interactionNavigation,
    });
  }

  protected getInteractionRoute(uid: string, part = '') {
    return `${this.fullLocation}/interaction/${uid}/${part}`;
  }

  protected checkPrompt(promptName: string) {
    if (!InteractionController.INTERACTION_TYPES.includes(promptName))
      throw new BadRequestException(`Invalid prompt ${promptName}`);
  }

  protected addAppRelativeParams({
    state,
    nonce,
    code_challenge_method,
    code_challenge,
    code_verifier,
  }: UnknownObject) {
    return filterUndefinedInObj({
      state,
      nonce,
      code_challenge_method,
      code_challenge,
      code_verifier,
    });
  }
}
