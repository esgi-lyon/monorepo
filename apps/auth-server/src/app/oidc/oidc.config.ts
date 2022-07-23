import { OidcConfiguration } from 'nest-oidc-provider';
import { UserService } from '../ldap/user.service';
import { AdditionalOIDCConfig } from './oidc.env-parse';
import { toSnakeCase } from '../utils/object.utils';

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
    required: (_) => false,
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
    Session: 1 * 24 * 60 * 60 * 1000,
    Interaction: 300000,
    Grant: 15 * 24 * 60 * 60 * 1000,
    IdToken: 15 * 24 * 60 * 60 * 1000,
    AccessToken: 15 * 24 * 60 * 60 * 1000,
    ClientCredentials: 5400000,
  },
  findAccount: async (_, id, token) => {
    const user = await userService.find(Number(id));

    return {
      accountId: id,
      async claims(use, scope) {
        return {
          sub: id,
          ...toSnakeCase(user),
        };
      },
    };
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
    resourceIndicators: { enabled: true },
    jwtUserinfo: { enabled: true },
    jwtIntrospection: { enabled: false },
    introspection: { enabled: true },
  },
  clients,
});

export default getConfig;
