import {
  Column,
  CreatedAt,
  Model,
  Table,
  Unique,
  UpdatedAt,
  IsEmail as SqIsEmail,
  DataType,
  BeforeCreate,
} from 'sequelize-typescript';
import { getRepoKey } from '../utils/db.utils';
import { pbkdf2Sync, randomBytes } from 'crypto';
import {
  IsNotEmpty,
  IsEmail,
  Length,
  IsEnum,
} from 'class-validator';
import { Exclude } from 'class-transformer';
import { ApiProperty } from '@nestjs/swagger';
import { IsPasswordValid } from '../validators/password/password.validator';

const [PASSWORD_MIN, PASSWORD_MAX] = [6, 16];

enum Gender {
  man = 'man',
  woman = 'woman',
  other = 'other',
}

export class LoginDto {
  @IsEmail()
  @ApiProperty()
  @IsNotEmpty()
  email: string;

  @ApiProperty()
  @IsNotEmpty()
  @Length(PASSWORD_MIN, PASSWORD_MAX)
  password: string;
}

export class UserDto {
  @IsEmail()
  @ApiProperty()
  @IsNotEmpty()
  email: string;

  // @IsPhoneNumber()
  @ApiProperty()
  @IsNotEmpty()
  phoneNumber: string;

  @ApiProperty()
  @IsNotEmpty()
  name: string;

  @ApiProperty()
  @IsNotEmpty()
  familyName: string;

  // @ApiProperty()
  // address: object = {};

  @ApiProperty()
  @IsNotEmpty()
  birthdate: Date;

  @ApiProperty({ enum: Object.keys(Gender) })
  @IsNotEmpty()
  @IsEnum(Gender)
  gender: Gender;

  @ApiProperty({ required: false })
  @IsPasswordValid({ strength: 1 })
  @Length(PASSWORD_MIN, PASSWORD_MAX)
  password: string;
}

export class RegisterUserDto extends UserDto {
  @ApiProperty()
  @IsPasswordValid({ strength: 1 })
  @Length(PASSWORD_MIN, PASSWORD_MAX)
  confirmationPassword: string
}

/**
 * Not able to be validated, prefer concrete class with dto
 */
export type RegisterDtoType = UserDto & { confirmationPassword: string };

export type PasswordChangeDtoType = UserDto & {
  confirmationPassword: string;
  oldPassword: string;
};

@Table
export class User extends Model<User> implements UserDto {
  public static readonly hashIterations = 310000;
  public static readonly keylen = 32;
  public static readonly digest = 'sha256';

  id: number;

  @Column
  name: string;

  @Column
  familyName: string;

  @Unique({ name: 'duplicate_email', msg: 'Email already registered' })
  @SqIsEmail
  @Column
  email: string;

  @Unique({ name: 'duplicate_phone', msg: 'Phone already registered' })
  @Column
  phoneNumber: string;

  @Column
  emailVerified: Boolean = true;

  @Column
  phoneNumberVerified: Boolean = true;

  @Column(DataType.JSONB)
  address!: object;

  @Column
  birthdate: Date;

  @Column({ type: DataType.ENUM({ values: Object.keys(Gender) }) })
  gender: Gender;

  @CreatedAt
  @Column
  createdAt: Date;

  @UpdatedAt
  @Column
  updatedAt: Date;

  @Exclude()
  @Column
  password: string;

  @Exclude()
  @Column
  salt: string;

  static isPasswordDiff(u: User, password: string): boolean {
    return (
      pbkdf2Sync(
        password,
        u.salt,
        User.hashIterations,
        User.keylen,
        User.digest
      ).toString('hex') !== u.password
    );
  }

  @BeforeCreate
  public static hashPassword(u: User, _: any) {
    u.salt = randomBytes(16).toString('hex');

    u.password = User.hashFromSalt(u.password, u.salt);
  }

  public static hashFromSalt(pass: string, salt: string) {
    return pbkdf2Sync(
      pass,
      salt,
      User.hashIterations,
      User.keylen,
      User.digest
    ).toString('hex');
  }
}

export class RegisterResultDto {
  @ApiProperty()
  public readonly message: string;

  @ApiProperty({
    description: "User included in result",
    type: UserDto,
  })
  public readonly user: User;

  constructor(message: string, user: User) {
    this.message = message;
    this.user = user;
  }
}

export class UpdateResultDto {
  @ApiProperty()
  public readonly message: string;
  @ApiProperty()
  public readonly result: string[];

  constructor(message: string, result: string[]) {
    this.message = message;
    this.result = result;
  }
}

export class UpdateUserDto extends UserDto {
  @ApiProperty({ required: false })
  confirmationPassword?: string;
  @ApiProperty({ required: false })
  oldPassword?: string;
}

export const UserRepository = {
  provide: getRepoKey(User.name),
  useValue: User,
}
