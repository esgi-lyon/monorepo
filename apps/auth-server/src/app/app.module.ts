import { InteractionModule } from './interaction/interaction.module';
import { Module } from '@nestjs/common';
import { SequelizeModule } from '@nestjs/sequelize';
import { OidcModule } from 'nest-oidc-provider';
import { AppController } from './app.controller';
import { dbFromConfigFactory, getServerConfig } from './environment';
import { OidcAdapterModule } from './oidc-adapter/adapter.module';
import { OidcConfigModule } from './oidc/oidc-config.module';
import { OidcConfigService } from './oidc/oidc-config.service';
import { User, UserRepository } from "./ldap/user.model";
import { LdapModule } from "./ldap/ldap.module";
import oidcRepos, { models } from "./oidc/oidc.model";
import { ConfigModule, ConfigService } from '@nestjs/config';
import { join } from "path";
import { getOidcClientsConfig } from "./oidc/oidc.env-parse";

@Module({
  imports: [
    ConfigModule.forRoot({
      envFilePath: [join(__dirname, '.env'), join(__dirname, '.env.development')],
      load: [getServerConfig, getOidcClientsConfig],
      isGlobal: true
    }),
    SequelizeModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: dbFromConfigFactory,
      inject: [ConfigService],
    }),
    SequelizeModule.forFeature([User, ...models]),
    OidcModule.forRootAsync({
      useExisting: OidcConfigService,
      imports: [
        ConfigModule,
        OidcAdapterModule,
        OidcConfigModule
      ],
    }),
    InteractionModule,
    LdapModule
  ],
  controllers: [AppController],
  providers: [UserRepository, ...oidcRepos],
})
export class AppModule {}
