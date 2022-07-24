import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

const Color primaryColor = Color.fromARGB(255, 0, 0, 0);
const Color errorColor = Color(0xffb3261E);
BorderRadius borderRadius = BorderRadius.circular(30.h);
const Color blackColor = Color(0xff3f3d56);
const double defaultPadding = 16.0;

ThemeData theme = ThemeData(
    primaryColorLight: primaryColor,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(color: blackColor),
      centerTitle: true,
    ),
    primaryColor: primaryColor,

    //Input Decoration
    inputDecorationTheme: InputDecorationTheme(
      focusColor: primaryColor,
      labelStyle: const TextStyle(color: blackColor),
      iconColor: blackColor,
      errorStyle: const TextStyle(
        color: errorColor,
      ),
      isDense: true,
      suffixIconColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.focused) &&
            !states.contains(MaterialState.error)) {
          return blackColor;
        }
        if (states.contains(MaterialState.error)) {
          return errorColor;
        }
        return Colors.black;
      }),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor),
        borderRadius: borderRadius,
      ),
      border: OutlineInputBorder(
        borderRadius: borderRadius,
      ),
    ),

    //ElevatedButtonDecoration
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        onPrimary: Colors.white,
        fixedSize: Size(100.w, 5.h),
      ),
    ),
    // Scaffold
    scaffoldBackgroundColor: Colors.white,

    // Floating Action button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor, foregroundColor: Colors.white));

//  todo : Put the libels on focus of the color primary