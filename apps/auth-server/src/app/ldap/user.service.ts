import {
  Inject,
  Injectable,
  UnauthorizedException,
  UnprocessableEntityException,
} from '@nestjs/common';
import { PasswordChangeDtoType, RegisterDtoType, RegisterResultDto, RegisterUserDto, UpdateResultDto, UpdateUserDto, User } from "./user.model";
import { getRepoKey } from "../utils/db.utils";
import { isEmpty } from "lodash";
import { BaseError } from "sequelize";

export class PasswordException extends BaseError {}

@Injectable()
export class UserService {
  constructor(
    @Inject(getRepoKey(User.name)) private userModel: typeof User
  ) {
  }

  async login(email: string, password: string): Promise<User> {
    const user = await this.findByEmail(email)

    if (isEmpty(user))
      throw new UnauthorizedException(`Failed login of ${email}: verify the email.`)

    if (User.isPasswordDiff(user, password))
      throw new UnauthorizedException(`Failed login of ${email}, verify the password.`)

    return this.secureClass(user) as User
  }

  async register(user: RegisterUserDto): Promise<RegisterResultDto> {
    this.checkPasswordEquals(user as RegisterDtoType)

    const u = await this.userModel.create(user, {
      hooks: true,
      individualHooks: true
    })

    if (isEmpty(u))
      throw new UnprocessableEntityException(`Failed registration of ${user.email}`)

    return new RegisterResultDto(
      `${u.email} successfully registered`,
      this.secureClass(u) as User
    )
  }

  async update(data: UpdateUserDto): Promise<UpdateResultDto>  {
    data = await this.parseAndValidatePasswordChangeCase(data as PasswordChangeDtoType)

    const result = await this.userModel.update(data, {
      where: { email: data.email },
      individualHooks: true,
      hooks: true
    })

    if (isEmpty(result))
      throw new UnprocessableEntityException(`Failed update of ${data.email}`)

    return new UpdateResultDto(
      `${data.email} successfully updated`,
      result
        .map(e => (e as unknown as object)['email'] ?? data.email)
        .filter(e => e != null)
    )
  }

  async findByEmail(email: string) {
    return await this.userModel.findOne({ where: { email }, raw: true })
  }

  async find(id: number): Promise<User> {
    return this.secureClass(
      await this.userModel.findByPk(id, { raw: true })
    ) as User
  }

  async deletion(id: number) {
    return await this.userModel.destroy({ where: { id } })
  }

  protected async parseAndValidatePasswordChangeCase(
    data: PasswordChangeDtoType
  ): Promise<PasswordChangeDtoType> {
    if (data.password == null || data.oldPassword == data.password) return data

    if (
      data?.oldPassword == null ||
      data?.email == null
    )
      throw new UnprocessableEntityException("Missing required data in [email, oldPassword]")

    this.checkPasswordEquals(data)

    const user = await this.userModel.findOne({
      where: { email: data.email }, raw: true }
    )

    if (isEmpty(user))
      throw new UnauthorizedException("Can't find existing user")

    if (User.isPasswordDiff(user, data.oldPassword))
      throw new UnauthorizedException("Old password is wrong")

    if (!User.isPasswordDiff(user, data.password))
      throw new UnauthorizedException("New password is the same as the last one")

    data.password = User.hashFromSalt(data.password, user.salt)

    return data
  }

  protected secureClass(u: User): Omit<User, "password" | "salt"> {
    u.password = null
    u.salt = null
    return u
  }

  protected checkPasswordEquals(registerOrUpdating: RegisterDtoType) {
    console.log(registerOrUpdating)
    if (registerOrUpdating.confirmationPassword !== registerOrUpdating.password)
      throw new UnauthorizedException("Password are not equals")
  }
}
