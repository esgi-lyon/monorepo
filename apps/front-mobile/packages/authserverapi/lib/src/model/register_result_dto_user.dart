//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:authserver/src/model/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_result_dto_user.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RegisterResultDtoUser {
  /// Returns a new [RegisterResultDtoUser] instance.
  RegisterResultDtoUser({

    required  this.email,

    required  this.phoneNumber,

    required  this.name,

    required  this.familyName,

    required  this.birthdate,

    required  this.gender,

     this.password,
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


  final RegisterResultDtoUserGenderEnum gender;



  @JsonKey(
    
    name: r'password',
    required: false,
    includeIfNull: false
  )


  final String? password;



  @override
  bool operator ==(Object other) => identical(this, other) || other is RegisterResultDtoUser &&
     other.email == email &&
     other.phoneNumber == phoneNumber &&
     other.name == name &&
     other.familyName == familyName &&
     other.birthdate == birthdate &&
     other.gender == gender &&
     other.password == password;

  @override
  int get hashCode =>
    email.hashCode +
    phoneNumber.hashCode +
    name.hashCode +
    familyName.hashCode +
    birthdate.hashCode +
    gender.hashCode +
    password.hashCode;

  factory RegisterResultDtoUser.fromJson(Map<String, dynamic> json) => _$RegisterResultDtoUserFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResultDtoUserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum RegisterResultDtoUserGenderEnum {
  @JsonValue(r'man')
  man,
  @JsonValue(r'woman')
  woman,
  @JsonValue(r'other')
  other,
}


