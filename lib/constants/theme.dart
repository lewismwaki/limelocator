import 'package:flutter/material.dart';

const Color primaryColor = Color(0xffADFF2F);
const Color accentColor = Color(0xff95F500);
const Color primaryWhite = Color(0xffF2F2F2);
const Color primaryBlack = Color(0xff0A0A0A);

ThemeData themeData = ThemeData(
  useMaterial3: true,
  inputDecorationTheme: inputDecorationTheme,
  colorScheme: colorScheme,
  fontFamily: 'SplineSans',
  scaffoldBackgroundColor: const Color(0xffF2F2F2),
  splashColor: primaryColor.withOpacity(.2),
  highlightColor: primaryColor.withOpacity(.2),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.white),
      elevation: MaterialStatePropertyAll(8),
      foregroundColor: MaterialStatePropertyAll(primaryBlack),
      padding: MaterialStatePropertyAll(EdgeInsets.zero),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
      foregroundColor: MaterialStateProperty.all(colorScheme.background),
      backgroundColor: MaterialStateProperty.all(colorScheme.onPrimary),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
      shape: MaterialStatePropertyAll(
        CircleBorder(
          side: BorderSide(
            color: colorScheme.outline.withOpacity(.5),
            width: 1.5,
          ),
        ),
      ),
      iconColor: const MaterialStatePropertyAll(primaryBlack),
      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
    ),
  ),
);

ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: primaryColor,
  primary: primaryColor,
  onPrimary: primaryBlack,
  background: primaryWhite,
);

InputDecorationTheme inputDecorationTheme = const InputDecorationTheme(
  isDense: true,
  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
  hintStyle: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),
);
