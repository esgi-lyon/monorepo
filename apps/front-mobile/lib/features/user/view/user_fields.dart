import 'package:date_field/date_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:abcleaver/commons/widgets/complex_button.dart';
import 'package:abcleaver/features/user/bloc/user_bloc.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key, this.initialVal}) : super(key: key);

  final String? initialVal;

  @override
  Widget build(BuildContext context) {
    if (initialVal != null) {
      context.read<UserBloc>().add(UserEmailChanged(initialVal.toString()));
    }

    return BlocBuilder<UserBloc, UserState>(
        buildWhen: (previous, current) {
          return previous.email != current.email;
        },
        builder: (context, state) => TextFormField(
              initialValue: initialVal,
              onChanged: (v) =>
                  context.read<UserBloc>().add(UserEmailChanged(v)),
              decoration: InputDecoration(
                hintText: 'login.hint'.tr(),
                labelText: 'login.email'.tr(),
                errorText: state.email.pure
                    ? null
                    : state.email.error?.toString().tr(),
              ),
            ));
  }
}

class PhoneInput extends StatelessWidget {
  const PhoneInput({Key? key, this.initialVal}) : super(key: key);

  final String? initialVal;

  @override
  Widget build(BuildContext context) {
    if (initialVal != null) {
      context.read<UserBloc>().add(UserPhoneChanged(initialVal.toString()));
    }

    return BlocBuilder<UserBloc, UserState>(
        buildWhen: (previous, current) {
          return previous.phoneNumber != current.phoneNumber;
        },
        builder: (context, state) => TextFormField(
              initialValue: initialVal,
              onChanged: (v) =>
                  context.read<UserBloc>().add(UserPhoneChanged(v)),
              decoration: InputDecoration(
                hintText: 'user.phone.hint'.tr(),
                labelText: 'user.phone.value'.tr(),
                errorText: state.phoneNumber.pure
                    ? null
                    : state.phoneNumber.error?.toString().tr(),
              ),
            ));
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key, this.initialVal}) : super(key: key);

  final String? initialVal;

  @override
  Widget build(BuildContext context) {
    if (initialVal != null) {
      context.read<UserBloc>().add(UserPasswordChanged(initialVal.toString()));
    }

    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          initialValue: initialVal,
          obscureText: true,
          onChanged: (password) =>
              context.read<UserBloc>().add(UserPasswordChanged(password)),
          decoration: InputDecoration(
            labelText: 'login.password.value'.tr(),
            hintText: 'login.password.hint'.tr(),
            errorText: state.password.pure
                ? null
                : state.password.error?.toString().tr(),
          ),
        );
      },
    );
  }
}

class ConfirmationPasswordInput extends StatelessWidget {
  const ConfirmationPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) =>
          previous.confirmationPassword != current.confirmationPassword,
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          onChanged: (v) =>
              context.read<UserBloc>().add(UserConfirmationPasswordChanged(v)),
          decoration: InputDecoration(
            labelText: 'login.password_confirmation.value'.tr(),
            hintText: 'login.password_confirmation.hint'.tr(),
            errorText: state.confirmationPassword.pure
                ? null
                : state.confirmationPassword.error?.toString().tr(),
          ),
        );
      },
    );
  }
}

class OldPasswordInput extends StatelessWidget {
  const OldPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) =>
          previous.confirmationPassword != current.confirmationPassword,
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          onChanged: (v) =>
              context.read<UserBloc>().add(UserOldPasswordChanged(v)),
          decoration: InputDecoration(
            labelText: 'login.password_old.value'.tr(),
            hintText: 'login.password_old.hint'.tr(),
            errorText: state.oldPassword.pure
                ? null
                : state.oldPassword.error?.toString().tr(),
          ),
        );
      },
    );
  }
}

class NameInput extends StatelessWidget {
  const NameInput({Key? key, this.initialVal}) : super(key: key);

  final String? initialVal;

  @override
  Widget build(BuildContext context) {
    if (initialVal != null) {
      context.read<UserBloc>().add(UserNameChanged(initialVal.toString()));
    }

    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextFormField(
          initialValue: initialVal,
          onChanged: (v) => context.read<UserBloc>().add(UserNameChanged(v)),
          decoration: InputDecoration(
            labelText: 'user.name.value'.tr(),
            hintText: 'user.name.hint'.tr(),
            errorText:
                state.name.pure ? null : state.name.error?.toString().tr(),
          ),
        );
      },
    );
  }
}

class FamilyNameInput extends StatelessWidget {
  const FamilyNameInput({Key? key, this.initialVal}) : super(key: key);

  final String? initialVal;

  @override
  Widget build(BuildContext context) {
    if (initialVal != null) {
      context
          .read<UserBloc>()
          .add(UserFamilyNameChanged(initialVal.toString()));
    }

    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) =>
          previous.familyName != current.familyName,
      builder: (context, state) {
        return TextFormField(
          initialValue: initialVal,
          onChanged: (familyName) =>
              context.read<UserBloc>().add(UserFamilyNameChanged(familyName)),
          decoration: InputDecoration(
            labelText: 'user.family_name.value'.tr(),
            hintText: 'user.family_name.hint'.tr(),
            errorText: state.familyName.pure
                ? null
                : state.familyName.error?.toString().tr(),
          ),
        );
      },
    );
  }
}

class BirthDateInput extends StatelessWidget {
  const BirthDateInput({Key? key, this.initialVal}) : super(key: key);

  final String? initialVal;

  @override
  Widget build(BuildContext context) {
    if (initialVal != null) {
      context.read<UserBloc>().add(UserBirthdateChanged(initialVal.toString()));
    }

    return BlocBuilder<UserBloc, UserState>(
        buildWhen: (previous, current) =>
            previous.birthdate != current.birthdate,
        builder: (context, state) {
          return DateTimeField(
            mode: DateTimeFieldPickerMode.date,
            onDateSelected: (DateTime value) {
              context
                  .read<UserBloc>()
                  .add(UserBirthdateChanged(value.toIso8601String()));
            },
            selectedDate:
                DateTime.tryParse(state.birthdate.value) ?? DateTime.now(),
          );
        });
  }
}

class GenderInput extends StatelessWidget {
  const GenderInput({Key? key, this.initialVal}) : super(key: key);

  final String? initialVal;

  @override
  Widget build(BuildContext context) {
    if (initialVal != null) {
      context.read<UserBloc>().add(UserGenderChanged(initialVal.toString()));
    }

    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return TextFormField(
          initialValue: initialVal.toString(),
          onChanged: (v) => context.read<UserBloc>().add(UserGenderChanged(v)),
          decoration: InputDecoration(
            labelText: 'user.gender.value'.tr(),
            hintText: 'user.gender.hint'.tr(),
            errorText:
                state.gender.pure ? null : state.gender.error?.toString().tr(),
          ),
        );
      },
    );
  }
}

class PictureInput extends StatelessWidget {
  const PictureInput({Key? key, this.initialVal}) : super(key: key);

  final String? initialVal;

  @override
  Widget build(BuildContext context) {
    if (initialVal != null) {
      context.read<UserBloc>().add(UserPictureChanged(initialVal.toString()));
    }

    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.picture != current.picture,
      builder: (context, state) {
        return TextFormField(
          initialValue: initialVal,
          onChanged: (v) => context.read<UserBloc>().add(UserPictureChanged(v)),
          decoration: InputDecoration(
            labelText: 'user.picture.value'.tr(),
            hintText: 'user.picture.hint'.tr(),
            errorText: state.picture.pure
                ? null
                : state.picture.error?.toString().tr(),
          ),
        );
      },
    );
  }
}

class SubmitButton<T extends UserEvent> extends StatelessWidget {
  const SubmitButton({Key? key, required this.event}) : super(key: key);

  final T event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : InternalButtonWidget(
                text: 'user.submit'.tr(),
                options: ComplexButtonOptions.of(context),
                onPressed: () {
                  context.read<UserBloc>().add(event);
                });
      },
    );
  }
}
