//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'interaction_consent_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InteractionConsentDto {
  /// Returns a new [InteractionConsentDto] instance.
  InteractionConsentDto({

    required  this.uid,

    required  this.links,
  });

  @JsonKey(
    
    name: r'uid',
    required: true,
    includeIfNull: false
  )


  final String uid;



  @JsonKey(
    
    name: r'_links',
    required: true,
    includeIfNull: false
  )


  final Object links;



  @override
  bool operator ==(Object other) => identical(this, other) || other is InteractionConsentDto &&
     other.uid == uid &&
     other.links == links;

  @override
  int get hashCode =>
    uid.hashCode +
    links.hashCode;

  factory InteractionConsentDto.fromJson(Map<String, dynamic> json) => _$InteractionConsentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$InteractionConsentDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

