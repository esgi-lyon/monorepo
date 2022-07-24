import 'dart:async';

import 'package:authserver/authserver.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:user_repository/src/models/models.dart';

import 'models/models.dart';

class UserRepository {
  User? _user;

  static final authServer = Authserver();
  static final dio = addInterceptors(authServer.dio);
  final apiClient = DefaultApi(dio);

  Future<User?> get(String email) async {
    return _user != null ? _user : await findByEmail(email);
  }

  // use patch
  Future<List<String>> update(UpdateUserDto u) async {
    var uRes = await apiClient.ldapControllerUpdate(updateUserDto: u);

    _user = await findByEmail(uRes.data!.result.first);

    return uRes.data!.result;
  }

  // use post
  Future<User?> register(RegisterUserDto u) async {
    var uDto =
        (await apiClient.ldapControllerRegister(registerUserDto: u)).data!.user;

    return User(uDto.name, uDto.phoneNumber, uDto.email, uDto.familyName, "",
        uDto.birthdate.toIso8601String(), uDto.name);
  }

  Future<User?> findByEmail(String email) async {
    try {
      var u = (await apiClient.ldapControllerFindByEmail(email: email)).data!;
      return User(u.name, u.phoneNumber, u.email, u.familyName, "",
          u.birthdate.toIso8601String(), u.gender.name);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Dio addInterceptors(Dio dio) {
    dio.interceptors.add(PrettyDioLogger());

    return dio;
  }
}
