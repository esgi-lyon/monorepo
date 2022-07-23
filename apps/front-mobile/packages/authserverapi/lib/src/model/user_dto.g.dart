// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserDto',
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
        final val = UserDto(
          email: $checkedConvert('email', (v) => v as String),
          phoneNumber: $checkedConvert('phoneNumber', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          familyName: $checkedConvert('familyName', (v) => v as String),
          address: $checkedConvert('address', (v) => v as Object),
          birthdate:
              $checkedConvert('birthdate', (v) => DateTime.parse(v as String)),
          gender: $checkedConvert(
              'gender', (v) => $enumDecode(_$UserDtoGenderEnumEnumMap, v)),
          password: $checkedConvert('password', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'familyName': instance.familyName,
      'address': instance.address,
      'birthdate': instance.birthdate.toIso8601String(),
      'gender': _$UserDtoGenderEnumEnumMap[instance.gender]!,
      'password': instance.password,
    };

const _$UserDtoGenderEnumEnumMap = {
  UserDtoGenderEnum.man: 'man',
  UserDtoGenderEnum.woman: 'woman',
  UserDtoGenderEnum.other: 'other',
};
