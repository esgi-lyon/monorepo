import 'dart:async';
import 'package:authserver/authserver.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, loading }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  final dio = Authserver().dio;
  final apiClient = Authserver().getDefaultApi();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    _controller.add(AuthenticationStatus.loading);
    var response = await dio.get('/oidc/auth', queryParameters: {
      'redirect_uri': 'http://localhost:3333/callback',
      'client_id': 'apps',
      'scope': ['openid', 'email', 'phone', 'profile'],
      'response_type': 'code',
      'grant_type': 'authorization_code'
    });

    print(response);

    await apiClient.interactionControllerLogin(uid: "uid");
    await apiClient.interactionControllerLoginCheck(uid: "uid");
  }
  
  Future<void> confirm(String uid) async {
    _controller.add(AuthenticationStatus.loading);
    await Future.delayed(const Duration(milliseconds: 1),
        () => _controller.add(AuthenticationStatus.unknown));
  }

  Future<void> consent(String uid) async {
    _controller.add(AuthenticationStatus.loading);
    await Future.delayed(const Duration(milliseconds: 1),
        () => _controller.add(AuthenticationStatus.unknown));
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
