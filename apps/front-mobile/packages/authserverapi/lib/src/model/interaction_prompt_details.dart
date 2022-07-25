//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'interaction_prompt_details.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InteractionPromptDetails {
  /// Returns a new [InteractionPromptDetails] instance.
  InteractionPromptDetails({

     this.missingOIDCScope,
  });

  @JsonKey(
    
    name: r'missingOIDCScope',
    required: false,
    includeIfNull: false
  )


  final List<String>? missingOIDCScope;



  @override
  bool operator ==(Object other) => identical(this, other) || other is InteractionPromptDetails &&
     other.missingOIDCScope == missingOIDCScope;

  @override
  int get hashCode =>
    missingOIDCScope.hashCode;

  factory InteractionPromptDetails.fromJson(Map<String, dynamic> json) => _$InteractionPromptDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$InteractionPromptDetailsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

