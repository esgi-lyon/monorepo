import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:httputils/httputils.dart';

void main() {
  test('adds one to input values', () async {
    var cookieStorage = HiveCookieStorage('./cookies');

    List<Cookie> cookies = [
      Cookie("name", "wendux"),
      Cookie("location", "china")
    ];
    var cj = PersistCookieJar(storage: cookieStorage);
    //Save cookies
    await cj.saveFromResponse(Uri.parse("https://www.baidu.com/"), cookies);
    //Get cookies
    List<Cookie> results =
        await cj.loadForRequest(Uri.parse("https://www.baidu.com/xx"));
    print(results);

    expect(await cookieStorage.read("www.baidu.com"), contains("name=wendux"));
  });
}
