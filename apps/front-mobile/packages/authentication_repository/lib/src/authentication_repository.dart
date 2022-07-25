import 'dart:async';
import 'dart:convert';
import 'package:authserver/authserver.dart';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, loading }

/**
 * In native platform redirection can't manage to store cookies
 * In web we can't skip redirections
 * Behaviour has two way available :
 *  - follow redirection on web and store cookie automaticly
 *  - skip redirection and process cookie storage and next location manually
 */
class AuthenticationRepository {
  AuthenticationRepository({required this.cookieStorage, required this.isWeb}) {
    this.dio = init(authServer.dio, this.cookieStorage);
    this.apiClient = DefaultApi(dio);
  }

  static final authServer = Authserver();

  Dio dio = authServer.dio;
  DefaultApi? apiClient;

  final Storage cookieStorage;

  final bool isWeb;

  final _controller = StreamController<AuthenticationStatus>();

  final _controllerErr = StreamController<String>();

  String currentLoggingInUsername = "";

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Stream<String> get error async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield "";
    yield* _controllerErr.stream;
  }

  Future<Map<String, dynamic>?> logIn({
    required String username,
    required String password,
  }) async {
    _controller.add(AuthenticationStatus.loading);
    currentLoggingInUsername = username;

    try {
      var loginUid = await uidFromOidcAuth();

      if (loginUid == "") {
        _controllerErr.add('No uid find during login');
        return null;
      }

      var loginCheckUid =
          await loginCheck(loginUid, username: username, password: password);

      return confirm(loginCheckUid);
    } catch (e) {
      currentLoggingInUsername = "";
      _controllerErr.add(e.toString());
      return null;
    }
  }

  Future<String> loginCheck(String uid,
      {required String username, required String password}) async {
    final checkStep1 = (await apiClient!.interactionControllerLoginCheck(
            uid: uid, loginDto: LoginDto(email: username, password: password)))
        as Response<Object>;

    if (this.isWeb) {
      return jsonDecode(checkStep1.toString())['uid'];
    }

    var checkStep2 =
        await dio.get<String>(checkStep1.headers.map['Location']!.first);

    return uidFromHeader(checkStep2.headers.map['Location']!.first);
  }

  Future<Map<String, dynamic>> confirm(String uid) async {
    _controller.add(AuthenticationStatus.loading);

    final confirmStep1 =
        await apiClient!.interactionControllerConfirmLogin(uid: uid);

    var callbackRes = jsonEncode(confirmStep1.data as Object);

    if (!isWeb) {
      Response<dynamic> confirmStep2 =
          await dio.get(confirmStep1.headers.map['Location']!.first);

      callbackRes =
          (await dio.get<Object>(confirmStep2.headers.map['Location']!.first))
              .data!
              .toString();
    }

    _controller.add(AuthenticationStatus.authenticated);

    return jsonDecode(callbackRes.toString());
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<String> uidFromOidcAuth() async {
    var oidcAuthRes = await dio.get<String>('/oidc/auth', queryParameters: {
      'redirect_uri': 'http://localhost:3333/callback',
      'client_id': 'apps',
      'scope': 'openid email phone profile',
      'response_type': 'code',
      'grant_type': 'authorization_code'
    });

    return uidFromResOrRedirectHeader(oidcAuthRes);
  }

  Dio init(Dio dio, Storage storage) {
    var cookieJar = PersistCookieJar(ignoreExpires: true, storage: storage);
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(PrettyDioLogger());
    dio.options.followRedirects = this.isWeb;
    dio.options.validateStatus = (status) {
      return status! <= 307;
    };

    if (this.isWeb) {
      dio.options.extra['withCredentials'] = true;
    }

    return dio;
  }

  String uidFromResOrRedirectHeader(Response<String> res) {
    return this.isWeb
        ? jsonDecode(res.data!)['uid']!
        : uidFromHeader(res.headers.map['Location']!.first);
  }

  String uidFromHeader(String header) {
    return header.split("interaction/").last;
  }

  void dispose() {
    _controller.close();
    _controllerErr.close();
  }
}
