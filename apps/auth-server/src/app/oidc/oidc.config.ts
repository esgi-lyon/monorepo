import { OidcConfiguration } from "nest-oidc-provider";
import { UserService } from "../ldap/user.service";
import { AdditionalOIDCConfig } from "./oidc.env-parse";
import {Account} from "oidc-provider";
import {toSnakeCase} from "../utils/object.utils";

const getConfig = (
  userService: UserService,
  { clients, cookies, jwks }: AdditionalOIDCConfig
): OidcConfiguration => ({
  scopes: [
    'openid',
    'email',
    'phone',
    'profile',
    // 'address'
  ],
  pkce: {
    methods: ['S256'],
    required: (_) => false
  },
  claims: {
    email: ['email', 'email_verified'],
    phone: ['phone_number', 'phone_number_verified'],
    profile: [
      'birthdate',
      'family_name',
      'gender',
      'name',
      'profile',
      'updated_at',
    ],
    // address: ['address'],
  },
  jwks,
  interactions: {
    url(_, interaction) {
      return `/interaction/${interaction.uid}`;
    },
  },
  ttl: {
    Session: 86400000,
    Interaction: 7200,
    Grant: 43200000,
    IdToken: 43200000,
    ClientCredentials: 5400000
  },
  findAccount: async (_, id, token) => {
    const user = await userService.find(Number(id))

    return {
      accountId: id,
      async claims(use, scope) {
        return {
          sub: id,
          ...toSnakeCase(user)
        }
      }
    }
  },
  cookies,
  clockTolerance: 5,
  features: {
    clientCredentials: { enabled: true },
    registration: { enabled: true },
    registrationManagement: { enabled: true },
    devInteractions: { enabled: false },
    deviceFlow: { enabled: true },
    revocation: { enabled: true },
    resourceIndicators: { enabled : true }
  },
  clients
});

export default getConfig
