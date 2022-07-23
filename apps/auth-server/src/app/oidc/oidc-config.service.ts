import {
  OidcModuleOptions,
  OidcModuleOptionsFactory,
} from 'nest-oidc-provider';
import { Injectable } from '@nestjs/common';
import { AdapterFactory, ClientMetadata } from 'oidc-provider';
import setupOidc from './oidc.config';
import { InjectModel } from '@nestjs/sequelize';
import { ModuleRef } from '@nestjs/core';
import { UserService } from '../ldap/user.service';
import { OidcAdapter } from '../oidc-adapter/oidc.adapter';
import { Client } from './oidc.model';
import { ConfigService } from '@nestjs/config';
import { AdditionalOIDCConfig } from './oidc.env-parse';

@Injectable()
export class OidcConfigService implements OidcModuleOptionsFactory {
  constructor(
    private readonly config: ConfigService,
    private readonly ref: ModuleRef,
    @InjectModel(Client) private clientModel: typeof Client,
    private readonly userService: UserService
  ) {}

  async createModuleOptions(): Promise<OidcModuleOptions> {
    await this.clientModel.sync({ alter: true });
    const path = this.config.get<string>('OIDC_PATH');
    return {
      path,
      issuer: `${this.config.get<string>('location')}${path}`,
      oidc: setupOidc(
        this.userService,
        this.config.get<AdditionalOIDCConfig>('oidcConfig')
      ),
    };
  }

  createAdapterFactory?(): AdapterFactory {
    return (modelName: string) => new OidcAdapter(modelName, this.ref);
  }
}
