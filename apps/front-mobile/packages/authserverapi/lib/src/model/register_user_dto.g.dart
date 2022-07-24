// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserDto _$RegisterUserDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RegisterUserDto',
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
            'gender',
            'confirmationPassword'
          ],
        );
        final val = RegisterUserDto(
          email: $checkedConvert('email', (v) => v as String),
          phoneNumber: $checkedConvert('phoneNumber', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          familyName: $checkedConvert('familyName', (v) => v as String),
          birthdate:
              $checkedConvert('birthdate', (v) => DateTime.parse(v as String)),
          gender: $checkedConvert('gender',
              (v) => $enumDecode(_$RegisterUserDtoGenderEnumEnumMap, v)),
          password: $checkedConvert('password', (v) => v as String?),
          confirmationPassword:
              $checkedConvert('confirmationPassword', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$RegisterUserDtoToJson(RegisterUserDto instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'phoneNumber': instance.phoneNumber,
    'name': instance.name,
    'familyName': instance.familyName,
    'birthdate': instance.birthdate.toIso8601String(),
    'gender': _$RegisterUserDtoGenderEnumEnumMap[instance.gender]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  val['confirmationPassword'] = instance.confirmationPassword;
  return val;
}

const _$RegisterUserDtoGenderEnumEnumMap = {
  RegisterUserDtoGenderEnum.man: 'man',
  RegisterUserDtoGenderEnum.woman: 'woman',
  RegisterUserDtoGenderEnum.other: 'other',
};
