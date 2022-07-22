import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quizz_event.dart';
part 'quizz_state.dart';
part 'quizz_bloc.freezed.dart';

class QuizzBloc extends Bloc<QuizzEvent, QuizzState> {
  QuizzBloc() : super(_Initial()) {
    on<QuizzEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
