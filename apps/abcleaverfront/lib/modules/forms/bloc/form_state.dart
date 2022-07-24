part of './form_bloc.dart';

@immutable
abstract class AppFormState extends Equatable {}

class DefaultFormState extends AppFormState {
  @override
  List<Object?> get props => [];
}

class InvalidFormState extends AppFormState {
  final Map<String, FieldError> fieldsError;

  InvalidFormState(this.fieldsError);

  @override
  List<Object?> get props => [fieldsError];
}

class ValidFormState extends AppFormState {
  @override
  List<Object?> get props => [];
}
