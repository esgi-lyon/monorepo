//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'update_result_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateResultDto {
  /// Returns a new [UpdateResultDto] instance.
  UpdateResultDto({

    required  this.message,

    required  this.result,
  });

  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: false
  )


  final String message;



  @JsonKey(
    
    name: r'result',
    required: true,
    includeIfNull: false
  )


  final List<String> result;



  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateResultDto &&
     other.message == message &&
     other.result == result;

  @override
  int get hashCode =>
    message.hashCode +
    result.hashCode;

  factory UpdateResultDto.fromJson(Map<String, dynamic> json) => _$UpdateResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateResultDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

