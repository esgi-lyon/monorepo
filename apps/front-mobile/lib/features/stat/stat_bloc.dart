import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stat_event.dart';
part 'stat_state.dart';

class StatBloc extends Bloc<StatEvent, StatState> {
  StatBloc() : super(StatInitial()) {
    on<StatEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
