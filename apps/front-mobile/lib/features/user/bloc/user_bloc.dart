import 'package:authserver/authserver.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:abcleaver/features/user/validations/email.dart';
import 'package:abcleaver/commons/validations/validations.dart';
import 'package:abcleaver/features/user/validations/password.dart';
import 'package:user_repository/user_repository.dart';
import 'package:abcleaver/commons/extensions/formz.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const UserState()) {
    on<UserEmailChanged>(_onEmailChanged);
    on<UserPhoneChanged>(_onPhoneChanged);
    on<UserNameChanged>(_onNameChanged);
    on<UserPasswordChanged>(_onPasswordChanged);
    on<UserConfirmationPasswordChanged>(_onConfirmationPasswordChanged);
    on<UserFamilyNameChanged>(_onFamilyNameChanged);
    on<UserPictureChanged>(_onPictureChanged);
    on<UserBirthdateChanged>(_onBirthdateChanged);
    on<UserGenderChanged>(_onGenderChanged);

    on<UserUpdateSubmitted>(_onUpdate);
    on<UserRegistrationSubmitted>(_onRegister);
    on<UserPasswordChangeSubmitted>(_onPasswordChange);
    on<UserOldPasswordChanged>(_onOldPasswordChange);
  }

  final UserRepository _userRepository;

  void _onEmailChanged(
    UserEmailChanged event,
    Emitter<UserState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        email,
        state.name,
        state.password,
        state.confirmationPassword,
        state.familyName,
        state.birthdate,
        state.gender
      ]),
    ));
  }

  void _onPhoneChanged(
    UserPhoneChanged event,
    Emitter<UserState> emit,
  ) {
    final phoneNumber = SimpleString.dirty(event.phoneNumber);
    emit(state.copyWith(
      phoneNumber: phoneNumber,
      status: Formz.validate([
        phoneNumber,
        state.name,
        state.password,
        state.confirmationPassword,
        state.familyName,
        state.birthdate,
        state.gender
      ]),
    ));
  }

  void _onNameChanged(
    UserNameChanged event,
    Emitter<UserState> emit,
  ) {
    final name = SimpleString.dirty(event.name);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([
        state.email,
        name,
        state.password,
        state.confirmationPassword,
        state.familyName,
        state.birthdate,
        state.gender
      ]),
    ));
  }

  void _onFamilyNameChanged(
    UserFamilyNameChanged event,
    Emitter<UserState> emit,
  ) {
    final familyName = SimpleString.dirty(event.familyName);
    emit(state.copyWith(
      familyName: familyName,
      status: Formz.validate([
        state.email,
        state.name,
        state.password,
        state.confirmationPassword,
        familyName,
        state.birthdate,
        state.gender
      ]),
    ));
  }

  void _onPictureChanged(
    UserPictureChanged event,
    Emitter<UserState> emit,
  ) {
    final picture = SimpleString.dirty(event.picture);
    emit(state.copyWith(
      picture: picture,
      status: Formz.validate([
        state.email,
        state.name,
        state.password,
        state.confirmationPassword,
        state.familyName,
        picture,
        state.birthdate,
        state.gender
      ]),
    ));
  }

  void _onBirthdateChanged(
    UserBirthdateChanged event,
    Emitter<UserState> emit,
  ) {
    final birthdate = SimpleString.dirty(event.birthdate);

    emit(state.copyWith(
      birthdate: birthdate,
      status: Formz.validate([
        state.email,
        state.name,
        state.password,
        state.confirmationPassword,
        state.familyName,
        birthdate,
        state.gender
      ]),
    ));
  }

  void _onGenderChanged(
    UserGenderChanged event,
    Emitter<UserState> emit,
  ) {
    final gender = SimpleString.dirty(event.gender);
    emit(state.copyWith(
      gender: gender,
      status: Formz.validate([
        state.email,
        state.name,
        state.password,
        state.confirmationPassword,
        state.familyName,
        gender,
        state.gender
      ]),
    ));
  }

  void _onPasswordChanged(
    UserPasswordChanged event,
    Emitter<UserState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([
        state.email,
        state.name,
        password,
        state.confirmationPassword,
        state.familyName,
        state.gender,
        state.gender
      ]),
    ));
  }

  void _onConfirmationPasswordChanged(
    UserConfirmationPasswordChanged event,
    Emitter<UserState> emit,
  ) {
    final confirmationPassword = Password.dirty(event.passwordConfirmation);
    emit(state.copyWith(
      confirmationPassword: confirmationPassword,
      status: Formz.validate([
        state.email,
        state.name,
        state.password,
        confirmationPassword,
        state.familyName,
        state.gender,
        state.gender
      ]),
    ));
  }

  void _onOldPasswordChange(
    UserOldPasswordChanged event,
    Emitter<UserState> emit,
  ) {
    final oldPassword = Password.dirty(event.oldPassword);
    emit(state.copyWith(
      oldPassword: oldPassword,
      status: Formz.validate([
        state.email,
        state.name,
        state.password,
        oldPassword,
        state.familyName,
        state.gender,
        state.gender
      ]),
    ));
  }

  void _onRegister(
    UserRegistrationSubmitted event,
    Emitter<UserState> emit,
  ) async {
    if (state.status.isOneOfInvalidStatus) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
      return;
    }

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      await _userRepository.register(state.toFullDto());
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  void _onUpdate(
    UserUpdateSubmitted event,
    Emitter<UserState> emit,
  ) async {
    if (state.parseInputs().where((element) => element.invalid).isNotEmpty) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
      return;
    }

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      await _userRepository.update(state.toUpdateDto());

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  void _onPasswordChange(
    UserPasswordChangeSubmitted event,
    Emitter<UserState> emit,
  ) async {
    final areValidPassChangeFields = state.email.valid &&
        state.password.valid &&
        state.confirmationPassword.valid;

    final oneFieldIsPure = state.email.pure ||
        state.password.pure ||
        state.confirmationPassword.pure;

    if (!areValidPassChangeFields || oneFieldIsPure) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
      return;
    }

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      await _userRepository.update(state.toUpdateDto());
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
