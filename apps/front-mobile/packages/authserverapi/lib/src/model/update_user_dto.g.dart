// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserDto _$UpdateUserDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UpdateUserDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'email',
            'phoneNumber',
            'name',
            'familyName',
            'birthdate',
            'gender'
          ],
        );
        final val = UpdateUserDto(
          email: $checkedConvert('email', (v) => v as String),
          phoneNumber: $checkedConvert('phoneNumber', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          familyName: $checkedConvert('familyName', (v) => v as String),
          birthdate:
              $checkedConvert('birthdate', (v) => DateTime.parse(v as String)),
          gender: $checkedConvert('gender',
              (v) => $enumDecode(_$UpdateUserDtoGenderEnumEnumMap, v)),
          password: $checkedConvert('password', (v) => v as String?),
          confirmationPassword:
              $checkedConvert('confirmationPassword', (v) => v as String?),
          oldPassword: $checkedConvert('oldPassword', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$UpdateUserDtoToJson(UpdateUserDto instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'phoneNumber': instance.phoneNumber,
    'name': instance.name,
    'familyName': instance.familyName,
    'birthdate': instance.birthdate.toIso8601String(),
    'gender': _$UpdateUserDtoGenderEnumEnumMap[instance.gender]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  writeNotNull('confirmationPassword', instance.confirmationPassword);
  writeNotNull('oldPassword', instance.oldPassword);
  return val;
}

const _$UpdateUserDtoGenderEnumEnumMap = {
  UpdateUserDtoGenderEnum.man: 'man',
  UpdateUserDtoGenderEnum.woman: 'woman',
  UpdateUserDtoGenderEnum.other: 'other',
};
