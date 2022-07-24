import 'package:abcleaverfront/screen/register/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.signUp)),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: SingleChildScrollView(child: RegisterForm()),
      ),
    );
  }
}
