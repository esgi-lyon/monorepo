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
            'address',
            'birthdate',
            'gender',
            'password'
          ],
        );
        final val = RegisterResultDtoUser(
          email: $checkedConvert('email', (v) => v as String),
          phoneNumber: $checkedConvert('phoneNumber', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          familyName: $checkedConvert('familyName', (v) => v as String),
          address: $checkedConvert('address', (v) => v as Object),
          birthdate:
              $checkedConvert('birthdate', (v) => DateTime.parse(v as String)),
          gender: $checkedConvert('gender',
              (v) => $enumDecode(_$RegisterResultDtoUserGenderEnumEnumMap, v)),
          password: $checkedConvert('password', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$RegisterResultDtoUserToJson(
        RegisterResultDtoUser instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'familyName': instance.familyName,
      'address': instance.address,
      'birthdate': instance.birthdate.toIso8601String(),
      'gender': _$RegisterResultDtoUserGenderEnumEnumMap[instance.gender]!,
      'password': instance.password,
    };

const _$RegisterResultDtoUserGenderEnumEnumMap = {
  RegisterResultDtoUserGenderEnum.man: 'man',
  RegisterResultDtoUserGenderEnum.woman: 'woman',
  RegisterResultDtoUserGenderEnum.other: 'other',
};
