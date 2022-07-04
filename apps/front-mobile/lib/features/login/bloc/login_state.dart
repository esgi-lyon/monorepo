part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.status = FormzStatus.pure,
      this.username = const Email.pure(),
      this.password = const Password.pure(),
      this.passwordSave = const SimpleBoolean.pure()});

  final FormzStatus status;
  final Email username;
  final Password password;
  final SimpleBoolean passwordSave;

  LoginState copyWith({
    FormzStatus? status,
    Email? username,
    Password? password,
    SimpleBoolean? passwordSave,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      passwordSave: passwordSave ?? this.passwordSave,
    );
  }

  @override
  List<Object> get props => [status, username, password, passwordSave];
}
