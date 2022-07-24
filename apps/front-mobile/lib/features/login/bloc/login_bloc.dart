import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:abcleaver/commons/validations/simple_boolean.dart';
import 'package:abcleaver/features/user/validations/user_validations.dart';
import 'package:abcleaver/commons/extensions/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginPasswordSaveChanged>(_onPasswordSaveChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Email.dirty(event.username);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([username, state.password, state.passwordSave]),
    ));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.username, password, state.passwordSave]),
    ));
  }

  void _onPasswordSaveChanged(
    LoginPasswordSaveChanged event,
    Emitter<LoginState> emit,
  ) {
    final passwordSave = SimpleBoolean.dirty(event.passwordSave);
    emit(state.copyWith(
      passwordSave: passwordSave,
      status: Formz.validate([state.username, state.password, passwordSave]),
    ));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isOneOfInvalidStatus) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
      return;
    }

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      var tokenInfo = await _authenticationRepository.logIn(
        username: state.username.value,
        password: state.password.value,
      );
      emit(state.copyWith(
          tokenInfo: tokenInfo, status: FormzStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
