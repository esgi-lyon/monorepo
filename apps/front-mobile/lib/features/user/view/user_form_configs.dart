import 'package:flutter/material.dart';
import 'package:myaccount/features/user/bloc/user_bloc.dart';
import 'package:myaccount/features/user/view/user_fields.dart';

class UserFormConfigs {
  static final updateInputs = [
    const EmailInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const NameInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const FamilyNameInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const GenderInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const BirthDateInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const PictureInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const ConfirmationPasswordInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const PasswordInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const SubmitButton(event: UserUpdateSubmitted()),
  ];

  static const registerWidgetKeyPrefix = 'register';

  static final registrationinputs = [
    const EmailInput(),
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
    const PasswordInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const ConfirmationPasswordInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const SubmitButton(event: UserPasswordChangeSubmitted()),
  ];
}
