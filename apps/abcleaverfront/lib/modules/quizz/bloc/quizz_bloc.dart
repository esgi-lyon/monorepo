
import 'package:abcleaverfront/modules/quizz/bloc/quizz_state.dart';
import 'package:abcleaverfront/modules/quizz/bloc/quizz_event.dart';
import 'package:bloc/bloc.dart';

import '../data/repository/quizz_repository.dart';


class QuizzBloc extends Bloc<QuizzEvent, QuizzState> {
  final QuizzRepository quizzRepository = QuizzRepository();

  QuizzBloc() : super(InitialQuizzState()) {
    on<LoadQuizzEvent>((event, emit) async {
      try {
        var quizz = await quizzRepository.get();
        emit(LoadedQuizzState(quizz));
      } catch (e) {
        emit(ErrorQuizzState(e.toString()));
      }
    });
  }
}



