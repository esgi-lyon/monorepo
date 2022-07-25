import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../modules/quizz/bloc/quizz_bloc.dart';
import '../../modules/quizz/bloc/quizz_state.dart';


class QuizzPage extends StatelessWidget {
  const QuizzPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Niveau 1',
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
                BlocBuilder<QuizzBloc, QuizzState>(
                  builder: (context, state) {
                    if(state is LoadedQuizzState) {
                      // NextQuestion
                      return Expanded(
                        child: GridView.builder(
                          itemCount: state.quizzs.length,
                          scrollDirection: Axis.vertical,
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
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
                                    "L",
                                    style: TextStyle(
                                        color: Color(0XFF6750A4), fontSize: 20),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Text("is loading");
                    }

                  },
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
