// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InteractionDto _$InteractionDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'InteractionDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['uid', '_links'],
        );
        final val = InteractionDto(
          uid: $checkedConvert('uid', (v) => v as String),
          links: $checkedConvert('_links', (v) => v as Object),
        );
        return val;
      },
      fieldKeyMap: const {'links': '_links'},
    );

Map<String, dynamic> _$InteractionDtoToJson(InteractionDto instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      '_links': instance.links,
    };
