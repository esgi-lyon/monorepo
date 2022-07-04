import 'package:authentication_repository/authentication_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myaccount/commons/constants/routes.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/commons/widgets/complex_button.dart';
import 'package:myaccount/features/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    _onForgotPassword() async {
      await Navigator.of(context).pushNamed(Routes.forgot);
    }

    _onRegister() async {
      await Navigator.of(context).pushNamed(Routes.register);
    }

    return Scaffold(
        backgroundColor: AppTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: BlocProvider(
                create: (context) {
                  return LoginBloc(
                    authenticationRepository:
                        RepositoryProvider.of<AuthenticationRepository>(
                            context),
                  );
                },
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.all(size.width - size.width * .90),
                  alignment: Alignment.center,
                  child: Column(children: [
                    const Padding(padding: EdgeInsets.all(24)),
                    Text(
                      'welcome',
                      style: AppTheme.of(context).title1,
                    ).tr(),
                    const Padding(padding: EdgeInsets.all(24)),
                    const LoginForm(),
                    const Padding(padding: EdgeInsets.all(12)),
                    Center(
                      child: InkWell(
                        onTap: _onForgotPassword,
                        child: Text(
                          "login.password.forgotten.value",
                          style: TextStyle(
                              color: AppTheme.of(context).secondaryText,
                              fontSize: 14),
                          textAlign: TextAlign.center,
                        ).tr(),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(12)),
                    Divider(
                      height: 2,
                      thickness: 2,
                      indent: 20,
                      endIndent: 0,
                      color: AppTheme.of(context).gray200,
                    ),
                    const Padding(padding: EdgeInsets.all(12)),
                    Center(
                      child: const Text(
                        "register.no_account",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ).tr(),
                    ),
                    const Padding(padding: EdgeInsets.all(12)),
                    Center(
                      child: InternalButtonWidget(
                        onPressed: _onRegister,
                        text: 'register.value'.tr(),
                        options: ComplexButtonOptions.of(context).override(
                            color: AppTheme.of(context).secondaryBackground,
                            textStyle: AppTheme.of(context).subtitle2),
                      ),
                    )
                  ]),
                )),
          ),
        ));
  }
}
