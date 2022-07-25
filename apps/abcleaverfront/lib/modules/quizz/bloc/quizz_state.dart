import 'package:equatable/equatable.dart';

import '../data/models/quizz.dart';

abstract class QuizzState extends Equatable {
  const QuizzState();

  @override
  List<Object> get props => [];
  }

class InitialQuizzState extends QuizzState {
  @override
  List<Object> get props => [];
}

class LoadedQuizzState extends QuizzState {
  final List<Question> quizzs;

  const LoadedQuizzState(this.quizzs);

  @override
  List<Object> get props => [quizzs];
}


class ErrorQuizzState extends QuizzState {
  final String error;

  const ErrorQuizzState(this.error);

  @override
  List<Object> get props => [error];
}
