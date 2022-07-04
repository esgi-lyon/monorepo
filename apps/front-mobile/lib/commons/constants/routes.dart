import 'package:flutter/material.dart';
import 'package:myaccount/app/home.dart';
import 'package:myaccount/app/splash_screen.dart';
import 'package:myaccount/commons/widgets/loading_indicator.dart';
import 'package:myaccount/features/login/view/login_view.dart';
import 'package:myaccount/features/settings/view/setting_page.dart';
import 'package:myaccount/features/user/view/user_forgot_page.dart';
import 'package:myaccount/features/user/view/user_view.dart';

class Routes {
  static const String splashScreen = '/';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgot = '/forgot';
  static const String settings = '/settings';
  static const String logout = '/logout';
  static const String home = '/home';
  static const String loading = '/loading';

  static Map<String, WidgetBuilder> all = {
    Routes.login: (context) => const LoginPage(),
    Routes.home: (context) => const Home(),
    Routes.splashScreen: (context) => const SplashScreen(),
    Routes.profile: (context) => const ProfilePage(),
    Routes.settings: (context) => const SettingPage(),
    Routes.register: (context) => const RegisterPage(),
    Routes.forgot: (context) => const ForgotPage(),
    Routes.loading: (context) => const LoadingIndicator(),
  };

  static Map<String, WidgetBuilder> bottomMenu = {
    Routes.home: (context) => const Home(),
    Routes.profile: (context) => const ProfilePage(),
    Routes.settings: (context) => const SettingPage()
  };
}
