import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:myaccount/app/simple_app_bar.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/features/user/bloc/user_bloc.dart';
import 'package:myaccount/features/user/view/user_form.dart';
import 'package:myaccount/features/user/view/user_form_configs.dart';
import 'package:user_repository/user_repository.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final contentSize = size.width - size.width * .90;

    return Scaffold(
        backgroundColor: AppTheme.of(context).primaryBackground,
        appBar: SimpleAppBar(
          'login.password.forgotten.value'.tr(),
          backButton: true,
        ),
        body: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
          Padding(
            padding:
                EdgeInsetsDirectional.fromSTEB(contentSize, 12, contentSize, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                    child: Text(
                      'login.password.forgotten.hint',
                      style: AppTheme.of(context).bodyText2,
                    ).tr(),
                  ),
                ),
              ],
            ),
          ),
          BlocProvider(
            create: (context) {
              return UserBloc(
                userRepository: RepositoryProvider.of<UserRepository>(context),
              );
            },
            child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(
                    horizontal: size.width - size.width * .90),
                alignment: Alignment.center,
                child: BlocListener<UserBloc, UserState>(
                    listener: ((context, state) =>
                        state.status.isSubmissionSuccess
                            ? Navigator.of(context).maybePop()
                            : null),
                    child: UserForm(
                      inputs: UserFormConfigs.forgotInputs,
                      successMessage: 'saved'.tr(),
                      failedMessage: 'failed'.tr(),
                    ))),
          ),
        ])));
  }
}
