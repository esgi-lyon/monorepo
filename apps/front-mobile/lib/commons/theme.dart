// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abcleaver/app/app.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class AppTheme {
  BorderRadius borderRadius = BorderRadius.circular(30.h);

  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    late final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  ThemeData getThemeData() => ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: primaryBackground),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          onPrimary: primaryColor,
          primary: secondaryColor,
          fixedSize: Size(100.w, 5.h),
        )),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
            borderRadius: borderRadius,
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius,
          ),
        ),
      );

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static AppTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;
  late Brightness brightness;

  late Color primaryBtnText;
  late Color lineColor;
  late Color customColor1;
  late Color grayIcon;
  late Color gray200;
  late Color gray600;
  late Color black600;
  late Color tertiary400;
  late Color textColor;

  // Button defaults
  late double buttonWidth = 270;
  late double buttonHeight = 50;
  late BorderSide buttonBorderSide = const BorderSide(
    color: Colors.transparent,
    width: 1,
  );
  late double buttonBorderRadiusNb = 10;
  late BorderRadius buttonBorderRadius =
      BorderRadius.circular(buttonBorderRadiusNb);
  late double buttonElevation = 3;

  TextStyle get title1 => GoogleFonts.getFont(
        'Roboto Slab',
        color: primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Roboto Slab',
        color: secondaryText,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Roboto Slab',
        color: primaryText,
        fontWeight: FontWeight.w300,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Roboto Slab',
        color: primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Roboto Slab',
        color: secondaryText,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Open Sans',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Open Sans',
        color: secondaryText,
        fontWeight: FontWeight.w300,
        fontSize: 14,
      );
}

class LightModeTheme extends AppTheme {
  final primaryColor = const Color(0xFFFFFFFF);
  final secondaryColor = const Color(0xFF5656A9);
  final tertiaryColor = const Color(0xFFB76B54);
  final alternate = const Color(0xFF5C90E7);
  final primaryBackground = const Color(0xFFF1F4F8);
  final secondaryBackground = const Color(0xFFFFFFFF);
  final primaryText = const Color(0xFF505050);
  final secondaryText = const Color(0xFF838383);
  final brightness = Brightness.light;
  final primaryBtnText = const Color(0xFFFFFFFF);
  final lineColor = const Color(0xFFE0E3E7);
  final customColor1 = const Color(0xFF2FB73C);
  final grayIcon = const Color(0xFF95A1AC);
  final gray200 = const Color(0xFFDBE2E7);
  final gray600 = const Color(0xFF262D34);
  final black600 = const Color(0xFF090F13);
  final tertiary400 = const Color(0xFF39D2C0);
  final textColor = const Color(0xFF1E2429);
}

class DarkModeTheme extends AppTheme {
  final primaryColor = const Color(0xFF6750A4);
  final secondaryColor = const Color(0xFF625B71);
  final tertiaryColor = const Color(0xFF7D5260);
  final alternate = const Color(0xFFB3261E);
  final primaryBackground = const Color(0xFF1A1F24);
  final secondaryBackground = const Color(0xFF101213);
  final primaryText = const Color(0xFFFFFFFF);
  final secondaryText = const Color(0xFF95A1AC);
  final brightness = Brightness.dark;
  final primaryBtnText = const Color(0xFFFFFFFF);
  final lineColor = const Color(0xFF22282F);
  final customColor1 = const Color(0xFF452FB7);
  final grayIcon = const Color(0xFF95A1AC);
  final gray200 = const Color(0xFFDBE2E7);
  final gray600 = const Color(0xFF262D34);
  final black600 = const Color(0xFF090F13);
  final tertiary400 = const Color(0xFF39D2C0);
  final textColor = const Color(0xFF1E2429);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    required String fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration ?? TextDecoration.none,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration ?? TextDecoration.none,
              height: lineHeight,
            );
}

void setDarkModeSetting(BuildContext context, ThemeMode themeMode) =>
    AppView.of(context).setThemeMode(themeMode);
