// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenDto _$TokenDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TokenDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'access_token',
            'expires_in',
            'id_token',
            'scope',
            'token_type'
          ],
        );
        final val = TokenDto(
          accessToken: $checkedConvert('access_token', (v) => v as String),
          expiresIn: $checkedConvert('expires_in', (v) => v as num),
          idToken: $checkedConvert('id_token', (v) => v as String),
          scope: $checkedConvert('scope', (v) => v as String),
          tokenType: $checkedConvert('token_type', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'accessToken': 'access_token',
        'expiresIn': 'expires_in',
        'idToken': 'id_token',
        'tokenType': 'token_type'
      },
    );

Map<String, dynamic> _$TokenDtoToJson(TokenDto instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'id_token': instance.idToken,
      'scope': instance.scope,
      'token_type': instance.tokenType,
    };
