import 'dart:convert';

import 'package:http/http.dart';

class Stats {
  int? nbAbsweredQuestion;
  double? rateCorrectAnswer;

  Stats(int nbAbsweredQuestion, double rateCorrectAnswer) {
    this.nbAbsweredQuestion = nbAbsweredQuestion;
    this.rateCorrectAnswer = rateCorrectAnswer;
  }
}
