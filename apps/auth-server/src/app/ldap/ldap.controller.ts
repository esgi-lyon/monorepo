import {
  Body,
  Controller,
  Patch,
  Post,
  Delete,
  Request, UseInterceptors
} from "@nestjs/common";
import { UserDto, RegisterDtoType, RegisterResultDto, UpdateResultDto } from "./user.model";
import { UserService } from "./user.service";
import { Request as Req } from 'express';
import { EntityErrorInterceptor } from "../interceptors/entity-error.interceptor";
import { ApiResponse } from "@nestjs/swagger";

@Controller("/ldap")
@UseInterceptors(EntityErrorInterceptor)
export class LdapController {
  constructor(
    private userService: UserService
  ) {}

  @Post()
  @ApiResponse({ status: 201, type: RegisterResultDto, description: 'Register user' })
  public async register(
    @Body() user: UserDto
  ): Promise<RegisterResultDto> {
    return this.userService.register(user as RegisterDtoType)
  }

  @Patch()
  @ApiResponse({ status: 201, type: UpdateResultDto, description: 'Update or change user password' })
  public async update(@Body() user: UserDto): Promise<UpdateResultDto> {
    return this.userService.update(user as RegisterDtoType)
  }

  @Delete()
  @ApiResponse({ status: 200, type: Number, description: 'Delete user' })
  public async deletion(
    @Request() req: Req
  ): Promise<number> {
    return await this.userService.deletion(Number(req.user))
  }
}
