import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../app_routes.dart';


class DashboardForm extends StatefulWidget {
  const DashboardForm({Key? key}) : super(key: key);

  @override
  State<DashboardForm> createState() => _DashboardForm();
}
class _DashboardForm extends State<DashboardForm> {
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
                  'Bienvenue',
                  style: TextStyle(fontSize: 20),
                ),
                const Text(
                  'Luce',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
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
                          // TODO Route vers quizz
                          Navigator.pushReplacementNamed(context, quizzRoute);
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
                          // TODO stat route
                          Navigator.pushReplacementNamed(context, statRoute);
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
                              style: TextStyle(fontSize: 20, color: Colors.green),
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
