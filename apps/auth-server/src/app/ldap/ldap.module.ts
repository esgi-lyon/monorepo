import { Module } from '@nestjs/common';
import { SequelizeModule } from '@nestjs/sequelize';
import { User, UserRepository } from './user.model';
import { UserService } from "./user.service";
import { LdapController } from "./ldap.controller";
import {EntityErrorInterceptor} from "../interceptors/entity-error.interceptor";

@Module({
    imports: [
      SequelizeModule.forFeature([User]),
    ],
    controllers: [LdapController],
    providers: [EntityErrorInterceptor, UserRepository, UserService],
    exports: [UserService]
})
export class LdapModule {}
