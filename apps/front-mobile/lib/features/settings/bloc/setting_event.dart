part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class SettingBiometricChanged extends SettingEvent {
  const SettingBiometricChanged(this.biometric);

  final bool biometric;

  @override
  List<Object> get props => [biometric];
}

class SettingLightThemeChanged extends SettingEvent {
  const SettingLightThemeChanged(this.lightTheme);

  final bool lightTheme;

  @override
  List<Object> get props => [lightTheme];
}

class SettingLocaleChanged extends SettingEvent {
  const SettingLocaleChanged(this.locale);

  final bool locale;

  @override
  List<Object> get props => [locale];
}

class LoginSubmitted extends SettingEvent {
  const LoginSubmitted();
}
