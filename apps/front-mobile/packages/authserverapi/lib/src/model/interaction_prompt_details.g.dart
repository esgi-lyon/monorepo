// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction_prompt_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InteractionPromptDetails _$InteractionPromptDetailsFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'InteractionPromptDetails',
      json,
      ($checkedConvert) {
        final val = InteractionPromptDetails(
          missingOIDCScope: $checkedConvert('missingOIDCScope',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$InteractionPromptDetailsToJson(
    InteractionPromptDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('missingOIDCScope', instance.missingOIDCScope);
  return val;
}
