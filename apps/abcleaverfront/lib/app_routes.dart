import 'package:abcleaverfront/screen/dashboard/widgets/dashboard_form.dart';
import 'package:abcleaverfront/screen/register/register_screen.dart';
import 'package:abcleaverfront/screen/reset-password/reset_password_screen.dart';
import 'package:abcleaverfront/screen/splash/splash_screen.dart';
import 'package:abcleaverfront/screen/stats/stats_screen.dart';
import 'package:flutter/material.dart';

const splashScreen = '/splash';
const loginRoute = '/login';
const registerRoute = 'register';
const dashboardRoute = '/dashboard';
const addNoteRoute = '/new-note';
const resetPasswordRoute = '/reset-password';

Map<String, WidgetBuilder> routes = {
  loginRoute: (context) => const StatsScreen(),
  splashScreen: (context) => const SplashScreen(),
  // loginRoute: (context) => const LoginScreen(),
  registerRoute: (context) => const RegisterScreen(),
  resetPasswordRoute: (context) => ResetPasswordScreen(),
  dashboardRoute: (context) => const DashboardForm()
};
