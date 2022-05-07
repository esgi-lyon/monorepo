import { Module } from '@nestjs/common';

import { OidcConfigService } from './oidc-config.service';
import { OidcAdapterModule } from '../oidc-adapter/adapter.module';
import { SequelizeModule } from '@nestjs/sequelize';
import { HttpModule } from "@nestjs/axios";
import { UserService } from "../ldap/user.service";
import { UserRepository } from "../ldap/user.model";
import oidcRepos, { models } from './oidc.model'

@Module({
  imports: [
    SequelizeModule.forFeature(models),
    OidcAdapterModule,
    HttpModule
  ],
  providers: [OidcConfigService, UserRepository, UserService, ...oidcRepos],
  exports: [SequelizeModule, OidcConfigService],
})
export class OidcConfigModule {}
