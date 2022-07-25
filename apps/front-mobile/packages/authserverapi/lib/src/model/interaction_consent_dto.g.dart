// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction_consent_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InteractionConsentDto _$InteractionConsentDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'InteractionConsentDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['uid', '_links'],
        );
        final val = InteractionConsentDto(
          uid: $checkedConvert('uid', (v) => v as String),
          links: $checkedConvert('_links', (v) => v as Object),
        );
        return val;
      },
      fieldKeyMap: const {'links': '_links'},
    );

Map<String, dynamic> _$InteractionConsentDtoToJson(
        InteractionConsentDto instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      '_links': instance.links,
    };
