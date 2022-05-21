import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../commons/theme.dart';

class QuizzPage extends StatelessWidget {
  const QuizzPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Niveau 1',
            style: TextStyle(color: AppTheme.of(context).secondaryColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SafeArea(
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/svg/baby-lion.svg',
                  height: 50.h,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      GestureDetector(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xFFEEE8F4),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          child: const Center(
                            child: Text(
                              'A',
                              style: TextStyle(
                                  color: Color(0XFF6750A4), fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xFFEEE8F4),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          child: const Center(
                            child: Text(
                              'L',
                              style: TextStyle(
                                  color: Color(0XFF6750A4), fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xFFEEE8F4),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          child: const Center(
                            child: Text(
                              'C',
                              style: TextStyle(
                                  color: Color(0XFF6750A4), fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xFFEEE8F4),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          child: const Center(
                            child: Text(
                              'B',
                              style: TextStyle(
                                  color: Color(0XFF6750A4), fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 60.w,
                  child: ElevatedButton(
                      onPressed: () {
                        print('hello');
                      },
                      child: const Icon(Icons.done)),
                )
              ],
            ),
          ),
        ));
  }
}
