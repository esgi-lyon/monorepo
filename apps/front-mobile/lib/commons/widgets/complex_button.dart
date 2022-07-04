import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myaccount/commons/theme.dart';

class ComplexButtonOptions {
  const ComplexButtonOptions({
    required this.textStyle,
    required this.elevation,
    required this.height,
    required this.width,
    this.padding,
    required this.color,
    this.disabledColor,
    this.disabledTextColor,
    this.overlayColor,
    this.iconSize,
    this.iconColor,
    this.iconPadding,
    required this.borderRadius,
    this.borderSide,
  });

  final TextStyle textStyle;
  final double elevation;
  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;
  final Color color;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? overlayColor;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry? iconPadding;
  final BorderRadius borderRadius;
  final BorderSide? borderSide;

  static ComplexButtonOptions of(BuildContext context) => ComplexButtonOptions(
        width: AppTheme.of(context).buttonWidth,
        height: AppTheme.of(context).buttonHeight,
        color: AppTheme.of(context).primaryText,
        textStyle: AppTheme.of(context).subtitle2.override(
              fontFamily: 'Roboto Slab',
              color: AppTheme.of(context).secondaryBackground,
            ),
        elevation: AppTheme.of(context).buttonElevation,
        borderSide: AppTheme.of(context).buttonBorderSide,
        borderRadius: AppTheme.of(context).buttonBorderRadius,
      );
}

extension InternalButtonOptionsHelper on ComplexButtonOptions {
  ComplexButtonOptions override(
          {TextStyle? textStyle,
          double? elevation,
          double? height,
          double? width,
          EdgeInsetsGeometry? padding,
          Color? color,
          Color? disabledColor,
          Color? disabledTextColor,
          Color? overlayColor,
          double? iconSize,
          Color? iconColor,
          EdgeInsetsGeometry? iconPadding,
          BorderRadius? borderRadius,
          BorderSide? borderSide}) =>
      ComplexButtonOptions(
        width: width ?? this.width,
        height: height ?? this.height,
        color: color ?? this.color,
        textStyle: textStyle ?? this.textStyle,
        elevation: elevation ?? this.elevation,
        borderSide: borderSide,
        borderRadius: borderRadius ?? this.borderRadius,
        disabledColor: disabledColor ?? this.disabledColor,
        disabledTextColor: disabledColor ?? this.disabledTextColor,
        overlayColor: overlayColor ?? this.overlayColor,
        iconSize: iconSize ?? this.iconSize,
        iconColor: iconColor ?? this.iconColor,
        iconPadding: iconPadding ?? this.iconPadding,
      );
}

class InternalButtonWidget extends StatefulWidget {
  const InternalButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.iconData,
    required this.options,
    this.showLoadingIndicator = true,
  }) : super(key: key);

  final String text;
  final Widget? icon;
  final IconData? iconData;
  final Function() onPressed;
  final ComplexButtonOptions options;
  final bool showLoadingIndicator;

  @override
  State<InternalButtonWidget> createState() => _InternalButtonWidgetState();
}

class _InternalButtonWidgetState extends State<InternalButtonWidget> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Widget textWidget = loading
        ? Center(
            child: SizedBox(
              width: 23,
              height: 23,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  widget.options.textStyle.color ?? Colors.white,
                ),
              ),
            ),
          )
        : AutoSizeText(
            widget.text,
            style: widget.options.textStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );

    final onPressed = widget.showLoadingIndicator
        ? () async {
            if (loading) {
              return;
            }
            setState(() => loading = true);
            try {
              await widget.onPressed();
            } finally {
              if (mounted) {
                setState(() => loading = false);
              }
            }
          }
        : () => widget.onPressed();

    ButtonStyle style = ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: widget.options.borderRadius,
          side: widget.options.borderSide ?? BorderSide.none,
        ),
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return widget.options.disabledTextColor;
          }
          return widget.options.textStyle.color;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return widget.options.disabledColor;
          }
          return widget.options.color;
        },
      ),
      overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.pressed) ||
            states.contains(MaterialState.focused) ||
            states.contains(MaterialState.hovered)) {
          return widget.options.overlayColor;
        }
        return null;
      }),
      padding: MaterialStateProperty.all(widget.options.padding ??
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0)),
      elevation: MaterialStateProperty.all<double>(widget.options.elevation),
    );

    if (widget.icon != null || widget.iconData != null) {
      return GestureDetector(
          child: SizedBox(
        height: widget.options.height,
        width: widget.options.width,
        child: ElevatedButton.icon(
          icon: Padding(
            padding: widget.options.iconPadding ?? EdgeInsets.zero,
            child: widget.icon ??
                FaIcon(
                  widget.iconData,
                  size: widget.options.iconSize,
                  color: widget.options.iconColor ??
                      widget.options.textStyle.color,
                ),
          ),
          label: textWidget,
          onPressed: onPressed,
          style: style,
        ),
      ));
    }

    return GestureDetector(
        child: SizedBox(
      height: widget.options.height,
      width: widget.options.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: textWidget,
      ),
    ));
  }
}
