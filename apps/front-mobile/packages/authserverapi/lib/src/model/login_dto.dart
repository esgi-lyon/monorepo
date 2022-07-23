//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'login_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LoginDto {
  /// Returns a new [LoginDto] instance.
  LoginDto({

    required  this.email,

    required  this.password,
  });

  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false
  )


  final String email;



  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false
  )


  final String password;



  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginDto &&
     other.email == email &&
     other.password == password;

  @override
  int get hashCode =>
    email.hashCode +
    password.hashCode;

  factory LoginDto.fromJson(Map<String, dynamic> json) => _$LoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

