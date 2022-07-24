part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserEmailChanged extends UserEvent {
  const UserEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class UserPhoneChanged extends UserEvent {
  const UserPhoneChanged(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class UserPasswordChanged extends UserEvent {
  const UserPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class UserConfirmationPasswordChanged extends UserEvent {
  const UserConfirmationPasswordChanged(this.passwordConfirmation);

  final String passwordConfirmation;

  @override
  List<Object> get props => [passwordConfirmation];
}

class UserOldPasswordChanged extends UserEvent {
  const UserOldPasswordChanged(this.oldPassword);

  final String oldPassword;

  @override
  List<Object> get props => [oldPassword];
}

class UserNameChanged extends UserEvent {
  const UserNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class UserFamilyNameChanged extends UserEvent {
  const UserFamilyNameChanged(this.familyName);

  final String familyName;

  @override
  List<Object> get props => [familyName];
}

class UserPictureChanged extends UserEvent {
  const UserPictureChanged(this.picture);

  final String picture;

  @override
  List<Object> get props => [picture];
}

class UserBirthdateChanged extends UserEvent {
  const UserBirthdateChanged(this.birthdate);

  final String birthdate;

  @override
  List<Object> get props => [birthdate];
}

class UserGenderChanged extends UserEvent {
  const UserGenderChanged(this.gender);

  final String gender;

  @override
  List<Object> get props => [gender];
}

class UserUpdateSubmitted extends UserEvent {
  const UserUpdateSubmitted();
}

class UserRegistrationSubmitted extends UserEvent {
  const UserRegistrationSubmitted();
}

class UserPasswordChangeSubmitted extends UserEvent {
  const UserPasswordChangeSubmitted();
}
