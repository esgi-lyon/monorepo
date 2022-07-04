import 'package:formz/formz.dart';

validateOrSkip(List<FormzInput> inputs, bool? skip) => (skip ?? false)
    ? Formz.validate(
        inputs.where((e) => e.value.toString().isNotEmpty).toList())
    : Formz.validate(inputs);
