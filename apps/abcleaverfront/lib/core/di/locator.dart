
import 'package:abcleaverfront/modules/quizz/bloc/quizz_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../modules/auth/bloc/auth_bloc.dart';
import '../../modules/forms/bloc/form_bloc.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AuthBloc>(() => AuthBloc());
  locator.registerLazySingleton<FormBloc>(() => FormBloc());
  locator.registerLazySingleton<QuizzBloc>(() => QuizzBloc());

}
