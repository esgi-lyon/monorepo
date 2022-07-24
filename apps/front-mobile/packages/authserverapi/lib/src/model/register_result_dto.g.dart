// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResultDto _$RegisterResultDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RegisterResultDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['message', 'user'],
        );
        final val = RegisterResultDto(
          message: $checkedConvert('message', (v) => v as String),
          user: $checkedConvert('user',
              (v) => RegisterResultDtoUser.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$RegisterResultDtoToJson(RegisterResultDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user.toJson(),
    };
