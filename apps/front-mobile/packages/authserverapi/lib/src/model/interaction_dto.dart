//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'interaction_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InteractionDto {
  /// Returns a new [InteractionDto] instance.
  InteractionDto({

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
  bool operator ==(Object other) => identical(this, other) || other is InteractionDto &&
     other.uid == uid &&
     other.links == links;

  @override
  int get hashCode =>
    uid.hashCode +
    links.hashCode;

  factory InteractionDto.fromJson(Map<String, dynamic> json) => _$InteractionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$InteractionDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

