import 'dart:async';
import 'dart:convert';
import 'package:authserver/authserver.dart';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, loading }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  String currentLoggingInUsername = "";

  static final authServer = Authserver();
  static final dio = addInterceptors(authServer.dio);
  final apiClient = DefaultApi(dio);

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<Map<String, dynamic>> logIn({
    required String username,
    required String password,
  }) async {
    _controller.add(AuthenticationStatus.loading);
    currentLoggingInUsername = username;

    try {
      var loginUid = await uidFromOidcAuth();

      if (loginUid == "") {
        return {'error': 'No uid find during login'};
      }

      var checkStep1 = (await apiClient.interactionControllerLoginCheck(
              uid: loginUid,
              loginDto: LoginDto(email: username, password: password))
          as Response<Object>);

      Response<dynamic> checkStep2 =
          await dio.get(checkStep1.headers.map['Location']!.first);

      return confirm(uidFromHeader(checkStep2.headers.map['Location']!.first));
    } catch (e) {
      currentLoggingInUsername = "";
      print(e.toString());
      return {'error': e};
    }
  }

  Future<Map<String, dynamic>> confirm(String uid) async {
    _controller.add(AuthenticationStatus.loading);

    Response<Object> confirmStep1 = await apiClient
        .interactionControllerConfirmLogin(uid: uid) as Response<Object>;

    Response<dynamic> confirmStep2 =
        await dio.get(confirmStep1.headers.map['Location']!.first);

    var callbackRes =
        await dio.get(confirmStep2.headers.map['Location']!.first);

    _controller.add(AuthenticationStatus.authenticated);

    return jsonDecode(callbackRes.toString());
  }

  Future<void> consent(String uid) async {
    _controller.add(AuthenticationStatus.loading);
    await Future.delayed(const Duration(milliseconds: 1),
        () => _controller.add(AuthenticationStatus.unknown));
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<String> uidFromOidcAuth() async {
    var oidcAuthRes = await dio.get('/oidc/auth', queryParameters: {
      'redirect_uri': 'http://localhost:3333/callback',
      'client_id': 'apps',
      'scope': 'openid email phone profile',
      'response_type': 'code',
      'grant_type': 'authorization_code'
    });

    return uidFromHeader(oidcAuthRes.headers.map['Location']!.first);
  }

  static Dio addInterceptors(Dio dio) {
    var cookieJar = PersistCookieJar(ignoreExpires: true);
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(PrettyDioLogger());
    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) {
      return status! <= 303;
    };

    return dio;
  }

  String uidFromHeader(String header) {
    return header.split("interaction/").last;
  }

  String secureGetUid(Map<String, dynamic>? data) {
    return data != null && data.containsKey('uid') ? data['uid'] : "";
  }

  void dispose() => _controller.close();
}
