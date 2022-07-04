import 'package:formz/formz.dart';

enum BooleanValueError { empty }

class SimpleBoolean extends FormzInput<bool, BooleanValueError> {
  const SimpleBoolean.pure() : super.pure(false);
  const SimpleBoolean.dirty([bool value = false]) : super.dirty(value);

  @override
  BooleanValueError? validator(bool? value) {
    return value != null ? null : BooleanValueError.empty;
  }
}
