part of 'quizz_bloc.dart';

@freezed
class QuizzEvent with _$QuizzEvent {
  const factory QuizzEvent.started() = _Started;
}