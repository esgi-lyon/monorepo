import 'dart:async';
// import 'package:http/http.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, loading }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

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
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
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
