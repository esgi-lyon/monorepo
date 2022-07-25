// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction_prompt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InteractionPrompt _$InteractionPromptFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'InteractionPrompt',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['name', 'reasons'],
        );
        final val = InteractionPrompt(
          name: $checkedConvert('name', (v) => v as String),
          reasons: $checkedConvert('reasons',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          details: $checkedConvert(
              'details',
              (v) => v == null
                  ? null
                  : InteractionPromptDetails.fromJson(
                      v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$InteractionPromptToJson(InteractionPrompt instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'reasons': instance.reasons,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('details', instance.details?.toJson());
  return val;
}
