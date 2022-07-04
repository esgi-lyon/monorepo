import 'dart:async';

import 'package:user_repository/src/models/models.dart';

import 'models/models.dart';

class UserRepository {
  User? _user;

  Future<User?> get() async {
    if (_user != null) return _user;
    return Future.delayed(
        const Duration(milliseconds: 300), () => _user = User.empty);
  }

  // use patch
  Future<User?> update(PartialUserDto? u) async {
    if (_user != null) return _user;
    return Future.delayed(
        const Duration(milliseconds: 300), () => _user = User.empty);
  }

  // use post
  Future<User?> register(FullUserDto u) async {
    if (_user != null) return _user;
    return Future.delayed(
        const Duration(milliseconds: 300), () => _user = User.empty);
  }
}
