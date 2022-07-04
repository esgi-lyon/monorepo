part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState(
      {this.status = FormzStatus.pure,
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.confirmationPassword = const Password.pure(),
      this.name = const SimpleString.pure(),
      this.familyName = const SimpleString.pure(),
      this.picture = const SimpleString.pure(),
      this.gender = const SimpleString.pure(),
      this.birthdate = const SimpleString.pure()});

  final FormzStatus status;
  final Email email;
  final Password password;
  final Password confirmationPassword;
  final SimpleString name;
  final SimpleString familyName;
  final SimpleString picture;
  final SimpleString gender;
  final SimpleString birthdate;

  UserState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
    Password? confirmationPassword,
    SimpleString? name,
    SimpleString? familyName,
    SimpleString? picture,
    SimpleString? birthdate,
    SimpleString? gender,
  }) =>
      UserState(
        status: status ?? this.status,
        name: name ?? this.name,
        password: password ?? this.password,
        familyName: familyName ?? this.familyName,
        confirmationPassword: confirmationPassword ?? this.confirmationPassword,
        email: email ?? this.email,
        birthdate: birthdate ?? this.birthdate,
        picture: picture ?? this.picture,
        gender: gender ?? this.gender,
      );

  toPartialDto() => PartialUserDto(
      name: name.value.toNullIfEmpty(),
      email: email.value.toNullIfEmpty(),
      familyName: familyName.value.toNullIfEmpty(),
      picture: picture.value.toNullIfEmpty(),
      birthdate: birthdate.value.toNullIfEmpty(),
      gender: gender.value.toNullIfEmpty(),
      password: password.value.toNullIfEmpty(),
      confirmationPassword: confirmationPassword.value.toNullIfEmpty());

  toFullDto() => FullUserDto(
      name: name.value,
      email: email.value,
      familyName: familyName.value,
      picture: picture.value,
      birthdate: birthdate.value,
      gender: gender.value,
      password: password.value,
      confirmationPassword: confirmationPassword.value);

  @override
  List<Object> get props => [
        status,
        email,
        name,
        familyName,
        password,
        confirmationPassword,
        picture,
        gender,
        birthdate
      ];
}
