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

  Future<User?> get() async {
    return _user;
  }

  // use patch
  Future<List<String>> update(UpdateUserDto u) async {
    var uRes = await apiClient.ldapControllerUpdate(updateUserDto: u);

    return uRes.data!.result;
  }

  // use post
  Future<User?> register(UserDto u) async {
    var uDto = (await apiClient.ldapControllerRegister(userDto: u)).data!.user;

    return User(uDto.name, uDto.email, uDto.familyName, "",
        uDto.birthdate.toIso8601String(), uDto.gender.toString());
  }

  static Dio addInterceptors(Dio dio) {
    dio.interceptors.add(PrettyDioLogger());

    return dio;
  }
}
