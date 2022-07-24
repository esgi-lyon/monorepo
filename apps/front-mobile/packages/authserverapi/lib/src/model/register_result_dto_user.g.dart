// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_result_dto_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResultDtoUser _$RegisterResultDtoUserFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'RegisterResultDtoUser',
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
        final val = RegisterResultDtoUser(
          email: $checkedConvert('email', (v) => v as String),
          phoneNumber: $checkedConvert('phoneNumber', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          familyName: $checkedConvert('familyName', (v) => v as String),
          birthdate:
              $checkedConvert('birthdate', (v) => DateTime.parse(v as String)),
          gender: $checkedConvert('gender',
              (v) => $enumDecode(_$RegisterResultDtoUserGenderEnumEnumMap, v)),
          password: $checkedConvert('password', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$RegisterResultDtoUserToJson(
    RegisterResultDtoUser instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'phoneNumber': instance.phoneNumber,
    'name': instance.name,
    'familyName': instance.familyName,
    'birthdate': instance.birthdate.toIso8601String(),
    'gender': _$RegisterResultDtoUserGenderEnumEnumMap[instance.gender]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  return val;
}

const _$RegisterResultDtoUserGenderEnumEnumMap = {
  RegisterResultDtoUserGenderEnum.man: 'man',
  RegisterResultDtoUserGenderEnum.woman: 'woman',
  RegisterResultDtoUserGenderEnum.other: 'other',
};
