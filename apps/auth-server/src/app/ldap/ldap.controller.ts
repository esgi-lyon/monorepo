import {
  Body,
  Controller,
  Patch,
  Post,
  Delete,
  Request, UseInterceptors, Get, Param, Query
} from "@nestjs/common";
import { UserDto, RegisterDtoType, RegisterResultDto, UpdateResultDto, UpdateUserDto, RegisterUserDto } from "./user.model";
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
    @Body() user: RegisterUserDto
  ): Promise<RegisterResultDto> {
    return this.userService.register(user)
  }

  @Patch()
  @ApiResponse({ status: 201, type: UpdateResultDto, description: 'Update or change user password' })
  public async update(@Body() user: UpdateUserDto): Promise<UpdateResultDto> {
    return this.userService.update(user)
  }

  @Delete()
  @ApiResponse({ status: 200, type: Number, description: 'Delete user' })
  public async deletion(
    @Request() req: Req
  ): Promise<number> {
    return await this.userService.deletion(Number(req.user))
  }

  @Get()
  @ApiResponse({ status: 200, type: UserDto, description: 'Find user' })
  public async findByEmail(
    @Query("email") email: string
  ): Promise<UserDto> {
    return await this.userService.findByEmail(email)
  }
}
