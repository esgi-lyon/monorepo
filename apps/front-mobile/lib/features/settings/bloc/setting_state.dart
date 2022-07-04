part of 'setting_bloc.dart';

class SettingState extends Equatable {
  const SettingState(
      {this.status = FormzStatus.pure,
      this.biometric = const SimpleBoolean.pure(),
      this.lightTheme = const SimpleBoolean.pure(),
      this.locale = const SimpleBoolean.pure()});

  final FormzStatus status;
  final SimpleBoolean biometric;
  final SimpleBoolean lightTheme;
  final SimpleBoolean locale;

  SettingState copyWith({
    FormzStatus? status,
    SimpleBoolean? biometric,
    SimpleBoolean? lightTheme,
    SimpleBoolean? locale,
  }) {
    return SettingState(
      status: status ?? this.status,
      biometric: biometric ?? this.biometric,
      lightTheme: lightTheme ?? this.lightTheme,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [status, biometric, lightTheme, locale];
}
