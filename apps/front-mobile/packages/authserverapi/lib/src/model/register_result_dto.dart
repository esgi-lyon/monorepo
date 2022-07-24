//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:authserver/src/model/register_result_dto_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_result_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RegisterResultDto {
  /// Returns a new [RegisterResultDto] instance.
  RegisterResultDto({

    required  this.message,

    required  this.user,
  });

  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: false
  )


  final String message;



  @JsonKey(
    
    name: r'user',
    required: true,
    includeIfNull: false
  )


  final RegisterResultDtoUser user;



  @override
  bool operator ==(Object other) => identical(this, other) || other is RegisterResultDto &&
     other.message == message &&
     other.user == user;

  @override
  int get hashCode =>
    message.hashCode +
    user.hashCode;

  factory RegisterResultDto.fromJson(Map<String, dynamic> json) => _$RegisterResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResultDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

