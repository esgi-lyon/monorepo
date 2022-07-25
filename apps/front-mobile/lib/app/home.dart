import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abcleaver/features/authentication/authentication.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../commons/constants/routes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/svg/baby-lion.svg',
                  height: 25.h,
                ),
                const Text(
                  'welcome',
                  style: TextStyle(fontSize: 20),
                ).tr(),
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    buildWhen: (previous, current) =>
                        previous.user != current.user,
                    builder: (context, state) => Text(
                          state.user.name,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold),
                        )),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.quizz);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(175, 254, 232, 167),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          child: const Center(
                            child: Text(
                              'Jouer !',
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.stat);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xFFC8E6C9),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          child: const Center(
                            child: Text(
                              'Statistiques',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.green),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFFFEF9E4),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12))),
                        child: const Center(
                          child: Text(
                            'Paramètres',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFFFCE86C)),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("tapped on container");
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xFFebe8fd),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          child: const Center(
                            child: Text(
                              'Espace parent',
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFF6e5ebb)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
