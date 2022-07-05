// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:abcleaver/commons/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:abcleaver/app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_repository/user_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await AppTheme.initialize();

    // Build our app and trigger a frame.
    await tester.pumpWidget(App(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
    ));
  });
}
