// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InteractionParams _$InteractionParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'InteractionParams',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'client_id',
            'redirect_uri',
            'response_type',
            'scope'
          ],
        );
        final val = InteractionParams(
          clientId: $checkedConvert('client_id', (v) => v as String),
          redirectUri: $checkedConvert('redirect_uri', (v) => v as String),
          responseType: $checkedConvert('response_type', (v) => v as String),
          scope: $checkedConvert('scope', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'clientId': 'client_id',
        'redirectUri': 'redirect_uri',
        'responseType': 'response_type'
      },
    );

Map<String, dynamic> _$InteractionParamsToJson(InteractionParams instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'redirect_uri': instance.redirectUri,
      'response_type': instance.responseType,
      'scope': instance.scope,
    };
