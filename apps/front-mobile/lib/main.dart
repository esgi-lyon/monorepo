import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:abcleaver/app/app.dart';
import 'package:abcleaver/commons/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppTheme.initialize();
  var storage = await createAuthorizedStorage();
  var authRepo = AuthenticationRepository(cookieStorage: storage.path);

  runApp(App(
    authenticationRepository: authRepo,
    userRepository: UserRepository(),
  ));
}

Future<Directory> createAuthorizedStorage() async {
  Directory appDocDirectory = await getApplicationDocumentsDirectory();

  var dir = Directory('${appDocDirectory.path}/assets/cookies')
      .create(recursive: true);

  return dir;
}
