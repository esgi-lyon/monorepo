part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState(
      {this.status = FormzStatus.pure,
      this.email = const Email.pure(),
      this.phoneNumber = const SimpleString.pure(),
      this.password = const Password.pure(),
      this.confirmationPassword = const Password.pure(),
      this.name = const SimpleString.pure(),
      this.familyName = const SimpleString.pure(),
      this.picture = const SimpleString.pure(),
      this.gender = const SimpleString.pure(),
      this.birthdate = const SimpleString.pure(),
      this.oldPassword = const Password.pure()});

  final FormzStatus status;
  final Email email;
  final Password password;
  final Password confirmationPassword;
  final Password oldPassword;
  final SimpleString name;
  final SimpleString phoneNumber;
  final SimpleString familyName;
  final SimpleString picture;
  final SimpleString gender;
  final SimpleString birthdate;

  UserState copyWith(
          {FormzStatus? status,
          Email? email,
          SimpleString? phoneNumber,
          Password? password,
          Password? confirmationPassword,
          SimpleString? name,
          SimpleString? familyName,
          SimpleString? picture,
          SimpleString? birthdate,
          SimpleString? gender,
          Password? oldPassword}) =>
      UserState(
        status: status ?? this.status,
        name: name ?? this.name,
        password: password ?? this.password,
        familyName: familyName ?? this.familyName,
        confirmationPassword: confirmationPassword ?? this.confirmationPassword,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        birthdate: birthdate ?? this.birthdate,
        picture: picture ?? this.picture,
        gender: gender ?? this.gender,
        oldPassword: oldPassword ?? this.oldPassword,
      );

  toUpdateDto() => UpdateUserDto(
      name: name.value,
      email: email.value,
      phoneNumber: phoneNumber.value,
      familyName: familyName.value,
      birthdate: DateTime.parse(birthdate.value),
      gender: gender.value == "man"
          ? UpdateUserDtoGenderEnum.man
          : gender.value == "woman"
              ? UpdateUserDtoGenderEnum.man
              : UpdateUserDtoGenderEnum.other,
      password: password.value,
      confirmationPassword: confirmationPassword.value,
      oldPassword: oldPassword.value);

  toFullDto() => RegisterUserDto(
      name: name.value,
      email: email.value,
      familyName: familyName.value,
      phoneNumber: phoneNumber.value,
      birthdate: DateTime.parse(birthdate.value),
      gender: gender.value == "man"
          ? RegisterUserDtoGenderEnum.man
          : gender.value == "woman"
              ? RegisterUserDtoGenderEnum.man
              : RegisterUserDtoGenderEnum.other,
      password: password.value,
      confirmationPassword: confirmationPassword.value);

  @override
  List<Object> get props => [
        status,
        email,
        phoneNumber,
        name,
        familyName,
        password,
        confirmationPassword,
        picture,
        gender,
        birthdate,
        oldPassword
      ];
}
