//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'interaction_params.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InteractionParams {
  /// Returns a new [InteractionParams] instance.
  InteractionParams({

    required  this.clientId,

    required  this.redirectUri,

    required  this.responseType,

    required  this.scope,
  });

  @JsonKey(
    
    name: r'client_id',
    required: true,
    includeIfNull: false
  )


  final String clientId;



  @JsonKey(
    
    name: r'redirect_uri',
    required: true,
    includeIfNull: false
  )


  final String redirectUri;



  @JsonKey(
    
    name: r'response_type',
    required: true,
    includeIfNull: false
  )


  final String responseType;



  @JsonKey(
    
    name: r'scope',
    required: true,
    includeIfNull: false
  )


  final String scope;



  @override
  bool operator ==(Object other) => identical(this, other) || other is InteractionParams &&
     other.clientId == clientId &&
     other.redirectUri == redirectUri &&
     other.responseType == responseType &&
     other.scope == scope;

  @override
  int get hashCode =>
    clientId.hashCode +
    redirectUri.hashCode +
    responseType.hashCode +
    scope.hashCode;

  factory InteractionParams.fromJson(Map<String, dynamic> json) => _$InteractionParamsFromJson(json);

  Map<String, dynamic> toJson() => _$InteractionParamsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

