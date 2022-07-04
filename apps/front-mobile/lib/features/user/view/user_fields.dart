import 'package:date_field/date_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:myaccount/commons/widgets/complex_button.dart';
import 'package:myaccount/commons/widgets/complex_text_field.dart';
import 'package:myaccount/features/user/bloc/user_bloc.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) => SimpleTextField(
              onChanged: (v) =>
                  context.read<UserBloc>().add(UserEmailChanged(v)),
              hintText: 'login.hint'.tr(),
              labelText: 'login.email'.tr(),
              errorText:
                  state.email.pure ? null : state.email.error?.toString().tr(),
            ));
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return SimpleTextField(
          obscureText: true,
          onChanged: (password) =>
              context.read<UserBloc>().add(UserPasswordChanged(password)),
          labelText: 'login.password.value'.tr(),
          hintText: 'login.password.hint'.tr(),
          errorText: state.password.pure
              ? null
              : state.password.error?.toString().tr(),
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
        return SimpleTextField(
          obscureText: true,
          onChanged: (v) =>
              context.read<UserBloc>().add(UserConfirmationPasswordChanged(v)),
          labelText: 'login.password_confirmation.value'.tr(),
          hintText: 'login.password_confirmation.hint'.tr(),
          errorText: state.confirmationPassword.pure
              ? null
              : state.confirmationPassword.error?.toString().tr(),
        );
      },
    );
  }
}

class NameInput extends StatelessWidget {
  const NameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return SimpleTextField(
          onChanged: (v) => context.read<UserBloc>().add(UserNameChanged(v)),
          labelText: 'user.name.value'.tr(),
          hintText: 'user.name.hint'.tr(),
          errorText: state.name.pure ? null : state.name.error?.toString().tr(),
        );
      },
    );
  }
}

class FamilyNameInput extends StatelessWidget {
  const FamilyNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) =>
          previous.familyName != current.familyName,
      builder: (context, state) {
        return SimpleTextField(
          onChanged: (familyName) =>
              context.read<UserBloc>().add(UserFamilyNameChanged(familyName)),
          labelText: 'user.family_name.value'.tr(),
          hintText: 'user.family_name.hint'.tr(),
          errorText: state.familyName.pure
              ? null
              : state.familyName.error?.toString().tr(),
        );
      },
    );
  }
}

class BirthDateInput extends StatelessWidget {
  const BirthDateInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  const GenderInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return SimpleTextField(
          onChanged: (v) => context.read<UserBloc>().add(UserGenderChanged(v)),
          labelText: 'user.gender.value'.tr(),
          hintText: 'user.gender.hint'.tr(),
          errorText:
              state.gender.pure ? null : state.gender.error?.toString().tr(),
        );
      },
    );
  }
}

class PictureInput extends StatelessWidget {
  const PictureInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.picture != current.picture,
      builder: (context, state) {
        return SimpleTextField(
          onChanged: (v) => context.read<UserBloc>().add(UserPictureChanged(v)),
          labelText: 'user.picture.value'.tr(),
          hintText: 'user.picture.hint'.tr(),
          errorText:
              state.picture.pure ? null : state.picture.error?.toString().tr(),
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
