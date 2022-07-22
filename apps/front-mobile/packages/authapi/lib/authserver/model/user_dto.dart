//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of abclever.api;

class UserDto {
  /// Returns a new [UserDto] instance.
  UserDto({
    required this.email,
    required this.phoneNumber,
    required this.name,
    required this.familyName,
    required this.address,
    required this.birthdate,
    required this.gender,
    required this.password,
  });

  String email;

  String phoneNumber;

  String name;

  String familyName;

  Object address;

  DateTime birthdate;

  UserDtoGenderEnum gender;

  String password;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserDto &&
     other.email == email &&
     other.phoneNumber == phoneNumber &&
     other.name == name &&
     other.familyName == familyName &&
     other.address == address &&
     other.birthdate == birthdate &&
     other.gender == gender &&
     other.password == password;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (email.hashCode) +
    (phoneNumber.hashCode) +
    (name.hashCode) +
    (familyName.hashCode) +
    (address.hashCode) +
    (birthdate.hashCode) +
    (gender.hashCode) +
    (password.hashCode);

  @override
  String toString() => 'UserDto[email=$email, phoneNumber=$phoneNumber, name=$name, familyName=$familyName, address=$address, birthdate=$birthdate, gender=$gender, password=$password]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'email'] = email;
      _json[r'phoneNumber'] = phoneNumber;
      _json[r'name'] = name;
      _json[r'familyName'] = familyName;
      _json[r'address'] = address;
      _json[r'birthdate'] = birthdate.toUtc().toIso8601String();
      _json[r'gender'] = gender;
      _json[r'password'] = password;
    return _json;
  }

  /// Returns a new [UserDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserDto(
        email: mapValueOfType<String>(json, r'email')!,
        phoneNumber: mapValueOfType<String>(json, r'phoneNumber')!,
        name: mapValueOfType<String>(json, r'name')!,
        familyName: mapValueOfType<String>(json, r'familyName')!,
        address: mapValueOfType<Object>(json, r'address')!,
        birthdate: mapDateTime(json, r'birthdate', '')!,
        gender: UserDtoGenderEnum.fromJson(json[r'gender'])!,
        password: mapValueOfType<String>(json, r'password')!,
      );
    }
    return null;
  }

  static List<UserDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserDto> mapFromJson(dynamic json) {
    final map = <String, UserDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserDto-objects as value to a dart map
  static Map<String, List<UserDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserDto.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'email',
    'phoneNumber',
    'name',
    'familyName',
    'address',
    'birthdate',
    'gender',
    'password',
  };
}


class UserDtoGenderEnum {
  /// Instantiate a new enum with the provided [value].
  const UserDtoGenderEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const man = UserDtoGenderEnum._(r'man');
  static const woman = UserDtoGenderEnum._(r'woman');
  static const other = UserDtoGenderEnum._(r'other');

  /// List of all possible values in this [enum][UserDtoGenderEnum].
  static const values = <UserDtoGenderEnum>[
    man,
    woman,
    other,
  ];

  static UserDtoGenderEnum? fromJson(dynamic value) => UserDtoGenderEnumTypeTransformer().decode(value);

  static List<UserDtoGenderEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserDtoGenderEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserDtoGenderEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UserDtoGenderEnum] to String,
/// and [decode] dynamic data back to [UserDtoGenderEnum].
class UserDtoGenderEnumTypeTransformer {
  factory UserDtoGenderEnumTypeTransformer() => _instance ??= const UserDtoGenderEnumTypeTransformer._();

  const UserDtoGenderEnumTypeTransformer._();

  String encode(UserDtoGenderEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a UserDtoGenderEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserDtoGenderEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'man': return UserDtoGenderEnum.man;
        case r'woman': return UserDtoGenderEnum.woman;
        case r'other': return UserDtoGenderEnum.other;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UserDtoGenderEnumTypeTransformer] instance.
  static UserDtoGenderEnumTypeTransformer? _instance;
}


