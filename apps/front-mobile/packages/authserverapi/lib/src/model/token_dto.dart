//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'token_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TokenDto {
  /// Returns a new [TokenDto] instance.
  TokenDto({

    required  this.accessToken,

    required  this.expiresIn,

    required  this.idToken,

    required  this.scope,

    required  this.tokenType,
  });

  @JsonKey(
    
    name: r'access_token',
    required: true,
    includeIfNull: false
  )


  final String accessToken;



  @JsonKey(
    
    name: r'expires_in',
    required: true,
    includeIfNull: false
  )


  final num expiresIn;



  @JsonKey(
    
    name: r'id_token',
    required: true,
    includeIfNull: false
  )


  final String idToken;



  @JsonKey(
    
    name: r'scope',
    required: true,
    includeIfNull: false
  )


  final String scope;



  @JsonKey(
    
    name: r'token_type',
    required: true,
    includeIfNull: false
  )


  final String tokenType;



  @override
  bool operator ==(Object other) => identical(this, other) || other is TokenDto &&
     other.accessToken == accessToken &&
     other.expiresIn == expiresIn &&
     other.idToken == idToken &&
     other.scope == scope &&
     other.tokenType == tokenType;

  @override
  int get hashCode =>
    accessToken.hashCode +
    expiresIn.hashCode +
    idToken.hashCode +
    scope.hashCode +
    tokenType.hashCode;

  factory TokenDto.fromJson(Map<String, dynamic> json) => _$TokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

