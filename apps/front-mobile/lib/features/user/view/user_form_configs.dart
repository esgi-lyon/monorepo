import 'package:flutter/material.dart';
import 'package:abcleaver/features/user/bloc/user_bloc.dart';
import 'package:abcleaver/features/user/view/user_fields.dart';
import 'package:user_repository/user_repository.dart';

class UserFormConfigs {
  static updateInputs(User user) {
    return [
      EmailInput(initialVal: user.email),
      const Padding(padding: EdgeInsets.all(12)),
      PhoneInput(initialVal: user.phoneNumber),
      const Padding(padding: EdgeInsets.all(12)),
      NameInput(initialVal: user.name),
      const Padding(padding: EdgeInsets.all(12)),
      FamilyNameInput(initialVal: user.familyName),
      const Padding(padding: EdgeInsets.all(12)),
      GenderInput(initialVal: user.gender),
      const Padding(padding: EdgeInsets.all(12)),
      BirthDateInput(initialVal: user.birthdate),
      // const Padding(padding: EdgeInsets.all(12)),
      // const PictureInput(),
      const Padding(padding: EdgeInsets.all(12)),
      const ConfirmationPasswordInput(),
      const Padding(padding: EdgeInsets.all(12)),
      const OldPasswordInput(),
      const Padding(padding: EdgeInsets.all(12)),
      const PasswordInput(),
      const Padding(padding: EdgeInsets.all(12)),
      const SubmitButton(event: UserUpdateSubmitted()),
    ];
  }

  static const registerWidgetKeyPrefix = 'register';

  static final registrationinputs = [
    const EmailInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const PhoneInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const NameInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const FamilyNameInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const GenderInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const BirthDateInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const ConfirmationPasswordInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const PasswordInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const SubmitButton(event: UserRegistrationSubmitted()),
  ];

  static final forgotInputs = [
    const Padding(padding: EdgeInsets.all(12)),
    const EmailInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const SubmitButton(event: UserPasswordChangeSubmitted()),
  ];
}
