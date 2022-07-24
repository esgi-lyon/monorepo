import 'package:abcleaver/features/quizz/view/quizz_page.dart';
import 'package:flutter/material.dart';
import 'package:abcleaver/app/home.dart';
import 'package:abcleaver/app/splash_screen.dart';
import 'package:abcleaver/commons/widgets/loading_indicator.dart';
import 'package:abcleaver/features/login/view/login_view.dart';
import 'package:abcleaver/features/settings/view/setting_page.dart';
import 'package:abcleaver/features/user/view/user_forgot_page.dart';
import 'package:abcleaver/features/user/view/user_view.dart';

import '../../features/stat/view/stat_page.dart';

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
  static const String quizz = '/quizz';
  static const String stat = '/stat';

  static Map<String, WidgetBuilder> all = {
    Routes.login: (context) => const LoginPage(),
    Routes.home: (context) => const Home(),
    Routes.splashScreen: (context) => const SplashScreen(),
    Routes.profile: (context) => const ProfilePage(),
    Routes.settings: (context) => const SettingPage(),
    Routes.register: (context) => const RegisterPage(),
    Routes.forgot: (context) => const ForgotPage(),
    Routes.loading: (context) => const LoadingIndicator(),
    Routes.quizz: (context) => const QuizzPage(),
    Routes.stat: (context) => const StatPage(),
  };

  static Map<String, WidgetBuilder> bottomMenu = {
    Routes.home: (context) => const Home(),
    Routes.profile: (context) => const ProfilePage(),
    Routes.settings: (context) => const SettingPage()
  };
}
