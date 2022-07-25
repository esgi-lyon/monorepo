import 'package:abcleaver/commons/storage.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:httputils/httputils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:abcleaver/app/app.dart';
import 'package:abcleaver/commons/theme.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppTheme.initialize();
  final dir = await createAuthorizedStorage("cookies");

  runApp(App(
    authenticationRepository: AuthenticationRepository(
        cookieStorage: HiveCookieStorage(dir?.path), isWeb: kIsWeb),
    userRepository: UserRepository(),
  ));
}
