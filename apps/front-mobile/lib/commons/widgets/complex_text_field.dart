import 'package:flutter/material.dart';
import 'package:myaccount/commons/theme.dart';

class SimpleTextField extends StatelessWidget {
  const SimpleTextField(
      {Key? key,
      this.textController,
      required this.labelText,
      required this.hintText,
      this.errorText,
      this.onChanged,
      this.obscureText})
      : super(key: key);

  final TextEditingController? textController;
  final String labelText;
  final String hintText;
  final String? errorText;
  final bool? obscureText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
      child: TextField(
        controller: textController,
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: AppTheme.of(context).bodyText2,
          hintText: hintText,
          errorText: errorText,
          errorStyle: AppTheme.of(context).bodyText1.override(
              fontFamily: 'Lexend Deca',
              color: AppTheme.of(context).tertiaryColor,
              fontSize: 9,
              fontWeight: FontWeight.w300),
          errorBorder: _getErrorBorder(context, 0),
          focusedErrorBorder: _getErrorBorder(context, 2),
          hintStyle: AppTheme.of(context).bodyText1.override(
                fontFamily: 'Lexend Deca',
                color: AppTheme.of(context).secondaryText,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 0,
            ),
            borderRadius: AppTheme.of(context).buttonBorderRadius,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 0,
            ),
            borderRadius: AppTheme.of(context).buttonBorderRadius,
          ),
          filled: true,
          fillColor: AppTheme.of(context).secondaryBackground,
          contentPadding: const EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
        ),
        style: AppTheme.of(context).bodyText1,
      ),
    );
  }

  _getErrorBorder(BuildContext context, double width) => OutlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme.of(context).tertiaryColor,
          width: width,
        ),
        borderRadius: AppTheme.of(context).buttonBorderRadius,
      );
}
