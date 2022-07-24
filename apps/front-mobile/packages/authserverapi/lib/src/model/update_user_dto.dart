//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'update_user_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateUserDto {
  /// Returns a new [UpdateUserDto] instance.
  UpdateUserDto({

    required  this.email,

    required  this.phoneNumber,

    required  this.name,

    required  this.familyName,

    required  this.birthdate,

    required  this.gender,

     this.password,

     this.confirmationPassword,

     this.oldPassword,
  });

  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false
  )


  final String email;



  @JsonKey(
    
    name: r'phoneNumber',
    required: true,
    includeIfNull: false
  )


  final String phoneNumber;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false
  )


  final String name;



  @JsonKey(
    
    name: r'familyName',
    required: true,
    includeIfNull: false
  )


  final String familyName;



  @JsonKey(
    
    name: r'birthdate',
    required: true,
    includeIfNull: false
  )


  final DateTime birthdate;



  @JsonKey(
    
    name: r'gender',
    required: true,
    includeIfNull: false
  )


  final UpdateUserDtoGenderEnum gender;



  @JsonKey(
    
    name: r'password',
    required: false,
    includeIfNull: false
  )


  final String? password;



  @JsonKey(
    
    name: r'confirmationPassword',
    required: false,
    includeIfNull: false
  )


  final String? confirmationPassword;



  @JsonKey(
    
    name: r'oldPassword',
    required: false,
    includeIfNull: false
  )


  final String? oldPassword;



  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateUserDto &&
     other.email == email &&
     other.phoneNumber == phoneNumber &&
     other.name == name &&
     other.familyName == familyName &&
     other.birthdate == birthdate &&
     other.gender == gender &&
     other.password == password &&
     other.confirmationPassword == confirmationPassword &&
     other.oldPassword == oldPassword;

  @override
  int get hashCode =>
    email.hashCode +
    phoneNumber.hashCode +
    name.hashCode +
    familyName.hashCode +
    birthdate.hashCode +
    gender.hashCode +
    password.hashCode +
    confirmationPassword.hashCode +
    oldPassword.hashCode;

  factory UpdateUserDto.fromJson(Map<String, dynamic> json) => _$UpdateUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum UpdateUserDtoGenderEnum {
  @JsonValue(r'man')
  man,
  @JsonValue(r'woman')
  woman,
  @JsonValue(r'other')
  other,
}


