import 'package:flutter/material.dart';
import 'package:kilo_takibi_uyg/config/colors.dart';

class ThemeClass {
  // *** LIGHT THEME ***
  static ThemeData lightTheme = ThemeData.light().copyWith(
    cardTheme: const CardTheme(color: LightColors.colorLight),
    canvasColor: LightColors.colorMedium,
    cardColor: LightColors.colorLight,
    scaffoldBackgroundColor: LightColors.colorBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: LightColors.colorBackground,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: LightColors.colorPrimary,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
      bodyLarge: TextStyle(
        color: LightColors.colorText,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
      bodyMedium: TextStyle(
        color: LightColors.colorText,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
      bodySmall: TextStyle(
        color: LightColors.colorText,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
      displaySmall: TextStyle(
        color: LightColors.colorPrimary,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
      labelSmall: TextStyle(
        color: LightColors.colorPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
    ),
    primaryColor: LightColors.colorPrimary,
    focusColor: LightColors.colorBottomBar,
    indicatorColor: LightColors.colorBottomBarIcons,
  );

  // *** DARK THEME ***
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    cardTheme: const CardTheme(color: DarkColors.colorDark),
    canvasColor: DarkColors.colorMedium,
    cardColor: DarkColors.colorDark,
    scaffoldBackgroundColor: DarkColors.colorbackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkColors.colorbackground,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: DarkColors.colorPrimary,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
      bodyLarge: TextStyle(
        color: DarkColors.colorText,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
      bodyMedium: TextStyle(
        color: DarkColors.colorText,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
      bodySmall: TextStyle(
        color: DarkColors.colorText,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
      displaySmall: TextStyle(
        color: DarkColors.colorPrimary,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
      labelSmall: TextStyle(
        color: DarkColors.colorPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
    ),
    primaryColor: DarkColors.colorPrimary,
    focusColor: DarkColors.colorBottomBar,
    indicatorColor: DarkColors.colorBottomBarIcons,
  );
}