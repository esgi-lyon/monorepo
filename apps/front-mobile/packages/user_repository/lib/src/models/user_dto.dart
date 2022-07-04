import 'package:equatable/equatable.dart';

class PartialUserDto extends Equatable {
  const PartialUserDto(
      {this.name,
      this.email,
      this.familyName,
      this.picture,
      this.birthdate,
      this.gender,
      this.password,
      this.confirmationPassword});

  final String? name;

  final String? email;
  final String? familyName;
  final String? picture;
  final String? birthdate;
  final String? gender;
  final String? password;
  final String? confirmationPassword;

  @override
  List<Object?> get props =>
      [name, email, familyName, birthdate, gender, picture];
}

class FullUserDto extends Equatable {
  const FullUserDto(
      {required this.name,
      required this.email,
      required this.familyName,
      required this.picture,
      required this.birthdate,
      required this.gender,
      required this.password,
      required this.confirmationPassword});

  final String name;

  final String email;
  final String familyName;
  final String picture;
  final String birthdate;
  final String gender;
  final String password;
  final String confirmationPassword;

  @override
  List<Object?> get props =>
      [name, email, familyName, birthdate, gender, picture];
}
