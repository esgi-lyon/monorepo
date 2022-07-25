//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:authserver/src/model/interaction_prompt_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interaction_prompt.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InteractionPrompt {
  /// Returns a new [InteractionPrompt] instance.
  InteractionPrompt({

    required  this.name,

    required  this.reasons,

     this.details,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false
  )


  final String name;



  @JsonKey(
    
    name: r'reasons',
    required: true,
    includeIfNull: false
  )


  final List<String> reasons;



  @JsonKey(
    
    name: r'details',
    required: false,
    includeIfNull: false
  )


  final InteractionPromptDetails? details;



  @override
  bool operator ==(Object other) => identical(this, other) || other is InteractionPrompt &&
     other.name == name &&
     other.reasons == reasons &&
     other.details == details;

  @override
  int get hashCode =>
    name.hashCode +
    reasons.hashCode +
    details.hashCode;

  factory InteractionPrompt.fromJson(Map<String, dynamic> json) => _$InteractionPromptFromJson(json);

  Map<String, dynamic> toJson() => _$InteractionPromptToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

