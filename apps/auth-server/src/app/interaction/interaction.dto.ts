import { ApiProperty } from '@nestjs/swagger';

class InteractionPromptDetails {
  @ApiProperty({ required: false })
  missingOIDCScope?: string[];
}

class InteractionPrompt {
  @ApiProperty()
  name: string;
  @ApiProperty()
  reasons: string[];
  @ApiProperty({ required: false })
  details?: InteractionPromptDetails
}

class InteractionParams {
  @ApiProperty()
  client_id: string;
  @ApiProperty()
  redirect_uri: string;
  @ApiProperty()
  response_type: string;
  @ApiProperty()
  scope: string;
}

export class InteractionBaseDto {
  @ApiProperty({ required: false })
  prompt?: InteractionPrompt
  @ApiProperty({ required: false })
  params?: InteractionParams
  @ApiProperty()
  uid: string;
}

export class InteractionDto extends InteractionBaseDto {
  @ApiProperty()
  _links: {
    login: string;
  };
}

export class InteractionConsentDto extends InteractionBaseDto {
  @ApiProperty()
  _links: {
    confirm: string;
    abort: string;
  };
}

export class TokenDto {
  @ApiProperty()
  access_token: string;
  @ApiProperty()
  expires_in: number;
  @ApiProperty()
  id_token: string;
  @ApiProperty()
  scope: string;
  @ApiProperty()
  token_type: string;
}
