part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.status = FormzStatus.pure,
      this.username = const Email.pure(),
      this.password = const Password.pure(),
      this.passwordSave = const SimpleBoolean.pure(),
      this.tokenInfo = const {}});

  final FormzStatus status;
  final Email username;
  final Password password;
  final SimpleBoolean passwordSave;
  final Map<String, dynamic> tokenInfo;

  LoginState copyWith(
      {FormzStatus? status,
      Email? username,
      Password? password,
      SimpleBoolean? passwordSave,
      Map<String, dynamic>? tokenInfo}) {
    return LoginState(
        status: status ?? this.status,
        username: username ?? this.username,
        password: password ?? this.password,
        passwordSave: passwordSave ?? this.passwordSave,
        tokenInfo: tokenInfo ?? this.tokenInfo);
  }

  @override
  List<Object> get props => [status, username, password, passwordSave];
}
