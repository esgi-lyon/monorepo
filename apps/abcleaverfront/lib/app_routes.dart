import 'package:abcleaverfront/screen/register/register_screen.dart';
import 'package:abcleaverfront/screen/reset-password/reset_password_screen.dart';
import 'package:abcleaverfront/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'modules/login/login_screen.dart';

const splashScreen = '/splash';
const loginRoute = '/login';
const registerRoute = 'register';
const dashboardRoute = '/dash';
const addNoteRoute = '/new-note';
const resetPasswordRoute = '/reset-password';

Map<String, WidgetBuilder> routes = {
  splashScreen: (context) => const SplashScreen(),
  loginRoute: (context) => const LoginScreen(),
  registerRoute: (context) => const RegisterScreen(),
  resetPasswordRoute: (context) => ResetPasswordScreen()
};
