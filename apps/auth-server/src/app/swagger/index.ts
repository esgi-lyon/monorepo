import { INestApplication } from '@nestjs/common';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import { OPEN_ID_ISSUER} from '../environment';
const SWAGGER_API_ROOT = 'api-docs',
  SWAGGER_API_NAME = 'Authentication server',
  SWAGGER_API_DESCRIPTION = 'Authentication with oidc provider documentation',
  SWAGGER_API_CURRENT_VERSION = '1.0';

export const setupSwagger = (app: INestApplication) => {
  const options = new DocumentBuilder()
    .setTitle(SWAGGER_API_NAME)
    .setDescription(SWAGGER_API_DESCRIPTION)
    .setVersion(SWAGGER_API_CURRENT_VERSION)
    .addSecurity('oidc', {
      type: 'openIdConnect',
      description: 'Open id server',
      name: 'oidc',
      openIdConnectUrl: `${OPEN_ID_ISSUER}/.well-known/openid-configuration`,
    })
    .build();
  const document = SwaggerModule.createDocument(app, options);
  SwaggerModule.setup(SWAGGER_API_ROOT, app, document);
};
