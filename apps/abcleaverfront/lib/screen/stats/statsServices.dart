import 'dart:convert';

import 'package:abcleaverfront/screen/stats/starts.dart';
import 'package:http/http.dart' as http;

class StatsServices {
  static Future<Stats> getStat(int userId) async {
    print("WEEEE AAAAAAAAAAAAARRRRRREEEEEEEEE THEEEEEERRRRRRREEEEEEE");
    final response = await http
        .get(Uri.parse('http://localhost:8083/stats?userId=123'), headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });
    //Uri(scheme: 'http', host: 'localhost:8083stats?userId=123')

    print("response");
    print(response);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      return new Stats(json.ten, json.df);
    } else {
      throw "Unable to get stats";
    }
  }
}
