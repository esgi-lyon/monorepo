import 'package:abcleaver/features/quizz/bloc/quizz_event.dart';
import 'package:abcleaver/features/quizz/bloc/quizz_state.dart';
import 'package:bloc/bloc.dart';

import '../data/repository/quizz_repository.dart';

class QuizzBloc extends Bloc<QuizzEvent, QuizzState> {
  final QuizzRepository quizzRepository = QuizzRepository();

  QuizzBloc() : super(InitialQuizzState()) {
    on<LoadQuizzEvent>((event, emit) async {
      try {
        var quizzs = await quizzRepository.get();
        emit(LoadedQuizzState(quizzs));
      } catch (e) {
        emit(ErrorQuizzState(e.toString()));
      }
    });
  }
}
