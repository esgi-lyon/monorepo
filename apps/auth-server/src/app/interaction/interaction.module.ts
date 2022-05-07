import { Module } from '@nestjs/common';
import { InteractionController } from './interaction.controller';
import { UserService } from "../ldap/user.service";
import {User, UserRepository} from "../ldap/user.model";
import { SequelizeModule } from "@nestjs/sequelize";

@Module({
  imports: [
    SequelizeModule.forFeature([User])
  ],
  controllers: [InteractionController],
  providers: [UserRepository, UserService],
})
export class InteractionModule {}
