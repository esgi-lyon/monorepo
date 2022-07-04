import 'package:formz/formz.dart';

enum StringValidationError { empty }

class SimpleString extends FormzInput<String, StringValidationError> {
  const SimpleString.pure() : super.pure('');
  const SimpleString.dirty([String value = '']) : super.dirty(value);

  @override
  StringValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : StringValidationError.empty;
  }
}
