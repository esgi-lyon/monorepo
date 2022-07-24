// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateResultDto _$UpdateResultDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UpdateResultDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['message', 'result'],
        );
        final val = UpdateResultDto(
          message: $checkedConvert('message', (v) => v as String),
          result: $checkedConvert('result',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$UpdateResultDtoToJson(UpdateResultDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
    };
