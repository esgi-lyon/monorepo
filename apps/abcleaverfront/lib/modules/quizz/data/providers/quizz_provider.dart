import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/quizz.dart';

class QuizzProvider {
  var urlGetQuizz ='localhost:8085';
  var urlSubmit = Uri.http('localhost:8085', '/user-answer');
  void onInit() {

  }

  Future<Quizz> getQuizz(int size) async {
    final url = Uri.http(urlGetQuizz, '/quizz?size=$size');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      print('Request failed with status: ${response.statusCode}.');
    }

    var jsonResponse = convert.jsonDecode(response.body) as  Map<String, dynamic>;
    return Quizz.fromJson(jsonResponse);
  }

  Future<bool> submitQuizz(String answer, int userId, String question) async {
    final response = await http.post(urlSubmit, body: jsonEncode({
      "answer": answer,
      "userId": userId,
      "question": question
    }));

    if (response.statusCode != 200) {
      print('Request failed with status: ${response.statusCode}.');
    }

    return response.body == 'true';



  }

}
