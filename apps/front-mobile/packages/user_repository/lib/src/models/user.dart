import 'package:equatable/equatable.dart';

enum gender { man, woman, other }

String dateFrom({d: String}) {
  return DateTime.tryParse(d) != null ? d : '';
}

String genderFrom({g: String}) {
  if (gender.values.contains(g)) return g;

  return '';
}

class User extends Equatable {
  const User(this.name, this.phoneNumber, this.email, this.familyName,
      this.picture, this.birthdate, this.gender);

  final String name;

  final String email;
  final String phoneNumber;
  final String familyName;
  final String picture;
  final String birthdate;
  final String gender;

  @override
  List<Object> get props =>
      [name, phoneNumber, email, familyName, picture, birthdate, gender];

  static const empty = User('-', '-', '-', '-', '-', '-', '-');
}
