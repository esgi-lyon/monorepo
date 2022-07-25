import 'package:abcleaverfront/modules/quizz/bloc/quizz_bloc.dart';
import 'package:abcleaverfront/screen/dashboard/widgets/dashboard_form.dart';
import 'package:abcleaverfront/screen/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';

import 'app_routes.dart';
import 'config/config.dart';
import 'core/di/locator.dart';
import 'firebase_options.dart';
import 'modules/auth/bloc/auth_bloc.dart';
import 'modules/forms/bloc/form_bloc.dart';
import 'modules/login/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final authBloc = locator<AuthBloc>();
  final formBloc = locator<FormBloc>();
  final quizzBloc = locator<QuizzBloc>();


  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        // l10n configuration
          localizationsDelegates:  [AppLocalizations.delegate,GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
          supportedLocales: const [
            Locale('fr', '')
          ],
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme,
          routes: routes,
          builder: (_, widget) {
            return MultiBlocProvider(providers: [
              BlocProvider<AuthBloc>(create: (_) => authBloc),
              BlocProvider<FormBloc>(create: (_) => formBloc),
              BlocProvider<QuizzBloc>(create: (_) => quizzBloc)
            ], child: widget ?? Container());
          },
          home: FutureBuilder<User?>(
              future: FirebaseAuth.instance.authStateChanges().first,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    // TODO Return Home Screen
                    return const DashboardForm();
                  }
                  return const LoginScreen();
                }
                return const SplashScreen();
              }));
    });
  }
}
