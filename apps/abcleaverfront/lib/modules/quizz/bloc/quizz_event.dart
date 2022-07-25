
import 'package:equatable/equatable.dart';

import '../data/models/quizz.dart';

abstract class QuizzEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadQuizzEvent extends QuizzEvent {
  final Quizz quizz;

  LoadQuizzEvent(this.quizz);
}


