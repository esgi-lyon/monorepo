
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_routes.dart';
import '../../config/config.dart';
import '../../core/di/locator.dart';
import '../../modules/auth/bloc/auth_bloc.dart';
import '../../modules/forms/bloc/form_bloc.dart';
import '../../modules/forms/validation/field_error.dart';


class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final authBloc = locator<AuthBloc>();
  final formBloc = locator<FormBloc>();

  _sendResetPassword() {
    authBloc.add(ResetPasswordRequested(_emailController.text));
  }

  _validateForm() {
    formBloc.add(ResetPasswordFormSubmittedEvent(_emailController.text));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(listener: ((context, state) {
          if (state is ResetPasswordMailSent) {
            Navigator.pushReplacementNamed(context, loginRoute);
          }
        })),
        BlocListener<FormBloc, AppFormState>(listener: (((context, state) {
          if (state is ValidFormState) {
            _sendResetPassword();
          }
        })))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.resetPassword),
        ),
        body: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(label: Text('Email')),
                ),
                BlocBuilder<FormBloc, AppFormState>(builder: ((context, state) {
                  if (state is InvalidFormState) {
                    if (state.fieldsError.containsKey("email")) {
                      if (state.fieldsError["email"] ==
                          FieldError.badEmailFormat) {
                            return Text(AppLocalizations.of(context)!.badFormatEmail);
                      } else if (state.fieldsError["email"] ==
                          FieldError.empty) {
                        return Text(AppLocalizations.of(context)!.emptyField);
                      }
                    }
                  }
                  return const Text("");
                })),
                SizedBox(height: 5.h),
                ElevatedButton(
                    onPressed: _validateForm, child: Text(AppLocalizations.of(context)!.send))
              ],
            )),
      ),
    );
  }
}
