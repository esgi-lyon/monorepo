import {
  Body,
  Controller,
  Patch,
  Post,
  Delete,
  Request, UseInterceptors
} from "@nestjs/common";
import { UserDto, RegisterDtoType } from "./user.model";
import { UserService } from "./user.service";
import { Request as Req } from 'express';
import { EntityErrorInterceptor } from "../interceptors/entity-error.interceptor";

@Controller("/ldap")
@UseInterceptors(EntityErrorInterceptor)
export class LdapController {
  constructor(
    private userService: UserService
  ) {}

  @Post()
  public async register(
    @Body() user: UserDto
  ) {
    return this.userService.register(user as RegisterDtoType)
  }

  @Patch()
  public async update(@Body() user: UserDto) {
    return this.userService.update(user as RegisterDtoType)
  }

  @Delete()
  public async deletion(
    @Request() req: Req
  ): Promise<number> {
    return await this.userService.deletion(Number(req.user))
  }
}
