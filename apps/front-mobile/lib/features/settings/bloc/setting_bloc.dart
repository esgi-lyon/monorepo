import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:myaccount/commons/validations/simple_boolean.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingState()) {
    on<SettingBiometricChanged>(_onBiometricChanged);
    on<SettingLightThemeChanged>(_onLightThemeChanged);
    on<SettingLocaleChanged>(_onLocaleChanged);
  }

  void _onBiometricChanged(
    SettingBiometricChanged event,
    Emitter<SettingState> emit,
  ) {
    final biometric = SimpleBoolean.dirty(event.biometric);
    emit(state.copyWith(
      biometric: biometric,
      status: Formz.validate([biometric]),
    ));
  }

  void _onLightThemeChanged(
    SettingLightThemeChanged event,
    Emitter<SettingState> emit,
  ) {
    final lightTheme = SimpleBoolean.dirty(event.lightTheme);
    emit(state.copyWith(
      lightTheme: lightTheme,
      status: Formz.validate([lightTheme]),
    ));
  }

  void _onLocaleChanged(
    SettingLocaleChanged event,
    Emitter<SettingState> emit,
  ) {
    final locale = SimpleBoolean.dirty(event.locale);
    emit(state.copyWith(
      locale: locale,
      status: Formz.validate([locale]),
    ));
  }
}
