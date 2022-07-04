import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/commons/widgets/form_message.dart';
import 'package:myaccount/features/user/bloc/user_bloc.dart';

class UserForm extends StatelessWidget {
  const UserForm(
      {Key? key,
      required this.inputs,
      this.successMessage = "Validated",
      this.failedMessage = "Failed"})
      : super(key: key);

  final List<Widget> inputs;

  final String successMessage;

  final String failedMessage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: ((context, state) {
        _snackFromState(context, state);
        _onSuccess(context, state);
      }),
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(mainAxisSize: MainAxisSize.min, children: inputs),
      ),
    );
  }

  void _snackFromState(BuildContext context, UserState state) {
    if (!state.status.isSubmissionFailure) return;

    FormMessage(
            color: AppTheme.of(context).tertiaryColor,
            validatedProperties:
                state.props.isEmpty ? [failedMessage] : state.props)
        .showSnackBar(context);
  }

  void _onSuccess(BuildContext context, UserState state) {
    if (!state.status.isSubmissionSuccess) return;

    FormMessage(
        color: AppTheme.of(context).secondaryColor,
        isInfo: true,
        validatedProperties: [successMessage]).showSnackBar(context);
  }
}
