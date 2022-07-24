import 'package:abcleaver/features/authentication/bloc/authentication_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abcleaver/app/simple_app_bar.dart';
import 'package:abcleaver/commons/theme.dart';
import 'package:abcleaver/features/user/bloc/user_bloc.dart';
import 'package:abcleaver/features/user/view/user_form.dart';
import 'package:abcleaver/features/user/view/user_form_configs.dart';
import 'package:user_repository/user_repository.dart';
import 'package:formz/formz.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppTheme.of(context).primaryBackground,
        appBar: SimpleAppBar('register.value'.tr(), backButton: true),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: BlocProvider(
                key: GlobalKey<_RegisterPageState>(),
                create: (context) {
                  return UserBloc(
                    userRepository:
                        RepositoryProvider.of<UserRepository>(context),
                  );
                },
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.all(size.width - size.width * .90),
                  alignment: Alignment.center,
                  child: BlocListener<UserBloc, UserState>(
                      listener: ((context, state) =>
                          state.status.isSubmissionSuccess
                              ? Navigator.of(context).maybePop()
                              : null),
                      child: UserForm(
                        inputs: UserFormConfigs.registrationinputs,
                        successMessage: 'saved'.tr(),
                        failedMessage: 'failed'.tr(),
                      )),
                ),
              )),
        ));
  }
}
