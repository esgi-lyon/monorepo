import { SequelizeModuleOptions } from '@nestjs/sequelize';
import { models } from './oidc/oidc.model';
import { User } from './ldap/user.model';
import { ConfigService } from '@nestjs/config';

export const IS_DEV = process.env.hasOwnProperty('APP_ENV')
  ? process.env?.APP_ENV === 'production'
  : true;

export const dbFromConfigFactory = (
  configService: ConfigService
): SequelizeModuleOptions => ({
  host: configService.get<string>('PG_HOST'),
  port: configService.get<number>('PG_PORT'),
  username: configService.get<string>('PG_AUTH_USER'),
  password: configService.get<string>('PG_AUTH_PASSWORD'),
  database: configService.get<string>('PG_AUTH_DB'),
  dialect: 'postgres',
  retryAttempts: 5,
  retryDelay: 2000,
  synchronize: true,
  autoLoadModels: true,
  models: [User, ...models],
});

type ServerConfig = {
  scheme: string;
  hostname: string;
  port: number;
  location: string;
};

export const getServerConfig = (): ServerConfig => {
  const infos = {
    port: parseInt(process.env?.PORT, 10) || 3333,
    hostname: process.env?.HOSTNAME || '0.0.0.0',
    scheme: process.env?.SCHEME || 'http',
    location: undefined,
  };

  infos.location = `${infos.scheme}://${infos.hostname}:${infos.port}`;

  return infos;
};
