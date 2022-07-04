import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/commons/widgets/form_message.dart';
import 'package:myaccount/features/settings/bloc/setting_bloc.dart';

class SettingForm extends StatelessWidget {
  const SettingForm({Key? key, this.successMessage = "success"})
      : super(key: key);

  final String successMessage;

  _snackFromState(BuildContext context, SettingState state) {
    if (!state.status.isInvalid) return;

    final message = FormMessage(
        color: AppTheme.of(context).tertiaryColor,
        validatedProperties: state.props);

    message.showSnackBar(context);
  }

  void _onSuccess(BuildContext context, SettingState state) {
    if (!state.status.isValid) return;

    FormMessage(
        color: AppTheme.of(context).secondaryColor,
        isInfo: true,
        validatedProperties: [successMessage]).showSnackBar(context);
  }

  _settingHint(BuildContext context) => Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                'settings.hint',
                style: AppTheme.of(context).bodyText2,
              ).tr(),
            ),
          ],
        ),
      );

  /// generate switch tile
  /// Sourrounded by bloc builder to bind state
  /// to field
  _switchTile(
          {required BuildContext context,
          required bool? value,
          required String title,
          required String subtitle,
          required ValueChanged<bool>? onChanged}) =>
      SwitchListTile.adaptive(
        value: value ??= false,
        onChanged: onChanged,
        title: Text(
          title,
          style: AppTheme.of(context).title3,
        ),
        subtitle: Text(
          subtitle,
          style: AppTheme.of(context).bodyText2,
        ).tr(),
        activeColor: AppTheme.of(context).secondaryColor,
        activeTrackColor: AppTheme.of(context).secondaryColor,
        dense: false,
        controlAffinity: ListTileControlAffinity.trailing,
        contentPadding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingBloc, SettingState>(
      listener: (context, state) {
        _snackFromState(context, state);
        _onSuccess(context, state);
      },
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _settingHint(context),
        BlocBuilder<SettingBloc, SettingState>(
            buildWhen: (previous, current) =>
                previous.biometric != current.biometric,
            builder: (context, state) => _switchTile(
                  context: context,
                  value: state.biometric.value,
                  title: 'settings.biometric.value'.tr(),
                  subtitle: 'settings.biometric.hint'.tr(),
                  onChanged: (v) => context
                      .read<SettingBloc>()
                      .add(SettingBiometricChanged(v)),
                )),
        const Padding(padding: EdgeInsets.all(12)),
        BlocBuilder<SettingBloc, SettingState>(
            buildWhen: (previous, current) =>
                previous.lightTheme != current.lightTheme,
            builder: (context, state) => _switchTile(
                  context: context,
                  value: state.lightTheme.value,
                  title: 'settings.light_theme.value'.tr(),
                  subtitle: 'settings.light_theme.hint'.tr(),
                  onChanged: (value) => context
                      .read<SettingBloc>()
                      .add(SettingLightThemeChanged(value)),
                )),
        const Padding(padding: EdgeInsets.all(12)),
        BlocBuilder<SettingBloc, SettingState>(
            buildWhen: (previous, current) => previous.locale != current.locale,
            builder: (context, state) => _switchTile(
                context: context,
                value: state.locale.value,
                title: 'settings.locale.value'.tr(),
                subtitle: 'settings.locale.hint'.tr(),
                onChanged: (v) =>
                    context.read<SettingBloc>().add(SettingLocaleChanged(v)))),
        const Padding(padding: EdgeInsets.all(12)),
      ]),
    );
  }
}
