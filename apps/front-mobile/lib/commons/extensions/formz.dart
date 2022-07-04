import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

extension FormzEquatable on Equatable {
  List<FormzInput> parseInputs() => props.whereType<FormzInput>().toList();
  FormzStatus parseFormStatus() =>
      props.whereType<FormzStatus>().toList().first;
}

extension FormzStatusCustom on FormzStatus {
  bool get isOneOfInvalidStatus => isInvalid || isPure || isSubmissionFailure;
}
