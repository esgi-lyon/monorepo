import {
  Column, CreatedAt, DataType, Model, PrimaryKey, Table, UpdatedAt
} from "sequelize-typescript";
import { getRepoKey } from "../utils/db.utils";

export class Client extends Model<Client> {

  @PrimaryKey
  @Column
  id: string;

  @Column(DataType.JSONB)
  data!: object;

  @Column
  consumed: boolean;

  @Column
  expiresAt: Date;

  @CreatedAt
  createdAt: Date

  @UpdatedAt
  updatedAt: Date
}

/**
 * Storing all grantable oidc fields
 */
@Table
export class Grant extends Model<Grant> {

  @Column
  id: string;

  @PrimaryKey
  @Column
  grantId: string

  @Column(DataType.JSONB)
  data!: object

  @Column
  consumed: boolean;

  @Column
  expiresAt: Date;

  @CreatedAt
  createdAt: Date

  @UpdatedAt
  updatedAt: Date
}

export const models =  [
  Client,
  Grant
]

export default models.map(md => ({ provide: getRepoKey(md.name), useValue: md }))
