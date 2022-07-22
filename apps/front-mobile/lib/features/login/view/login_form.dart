import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:abcleaver/commons/theme.dart';
import 'package:abcleaver/commons/widgets/form_message.dart';
import 'package:abcleaver/commons/widgets/complex_button.dart';
import 'package:abcleaver/commons/widgets/complex_text_field.dart';
import 'package:abcleaver/features/login/login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  snackFromState(LoginState state, BuildContext context) {
    if (!state.status.isSubmissionFailure) return;

    final message = FormMessage(
        color: AppTheme.of(context).tertiaryColor,
        validatedProperties: state.props);

    message.showSnackBar(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        snackFromState(state, context);
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          _UsernameInput(),
          const Padding(padding: EdgeInsets.all(12)),
          _PasswordInput(),
          const Padding(padding: EdgeInsets.all(12)),
          const Padding(padding: EdgeInsets.all(12)),
          _LoginButton(),
        ]),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_SimpleTextField'),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            hintText: 'login.hint'.tr(),
            labelText: 'login.email'.tr(),
            errorText: state.username.pure
                ? null
                : state.username.error?.toString().tr(),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          obscureText: true,
          key: const Key('loginForm_passwordInput_SimpleTextField'),
          decoration: InputDecoration(
            labelText: 'login.password.value'.tr(),
            hintText: 'login.password.hint'.tr(),
            errorText: state.password.pure
                ? null
                : state.password.error?.toString().tr(),
          ),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: () {
                  context.read<LoginBloc>().add(const LoginSubmitted());
                },
                child: Text('login.connect'.tr()));
      },
    );
  }
}
