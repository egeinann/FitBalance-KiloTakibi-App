import 'package:flutter/material.dart';
import 'package:kilo_takibi_uyg/appCustoms/colors.dart';
import 'package:google_fonts/google_fonts.dart';

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
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        color: LightColors.colorPrimary,
        fontSize: 22,
        fontWeight: FontWeight.w700, // Kalın font
      ),
      bodyLarge: GoogleFonts.poppins(
        color: LightColors.colorText,
        fontSize: 16,
        fontWeight: FontWeight.w700, // Kalın font
      ),
      bodyMedium: GoogleFonts.poppins(
        color: LightColors.colorText,
        fontSize: 14,
        fontWeight: FontWeight.w700, // Kalın font
      ),
      bodySmall: GoogleFonts.poppins(
        color: LightColors.colorText,
        fontSize: 12,
        fontWeight: FontWeight.w700, // Kalın font
      ),
      displaySmall: GoogleFonts.poppins(
        color: LightColors.colorPrimary,
        fontSize: 28,
        fontWeight: FontWeight.w700, // Kalın font
      ),
      labelSmall: GoogleFonts.poppins(
        color: LightColors.colorPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w700, // Kalın font
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
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        color: DarkColors.colorPrimary,
        fontSize: 22,
        fontWeight: FontWeight.w700, // Kalın font
      ),
      bodyLarge: GoogleFonts.poppins(
        color: DarkColors.colorText,
        fontSize: 16,
        fontWeight: FontWeight.w700, // Kalın font
      ),
      bodyMedium: GoogleFonts.poppins(
        color: DarkColors.colorText,
        fontSize: 14,
        fontWeight: FontWeight.w700, // Kalın font
      ),
      bodySmall: GoogleFonts.poppins(
        color: DarkColors.colorText,
        fontSize: 12,
        fontWeight: FontWeight.w700, // Kalın font
      ),
      displaySmall: GoogleFonts.poppins(
        color: DarkColors.colorPrimary,
        fontSize: 28,
        fontWeight: FontWeight.w700, // Kalın font
      ),
      labelSmall: GoogleFonts.poppins(
        color: DarkColors.colorPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w700, // Kalın font
      ),
    ),
    primaryColor: DarkColors.colorPrimary,
    focusColor: DarkColors.colorBottomBar,
    indicatorColor: DarkColors.colorBottomBarIcons,
  );
}


/*
import 'package:flutter/material.dart';
import 'package:kilo_takibi_uyg/appCustoms/colors.dart';

class ThemeClass {
  // *** LIGHT THEME *** LIGHT THEME *** LIGHT THEME *** LIGHT THEME *** LIGHT THEME *** LIGHT THEME *** LIGHT THEME *** LIGHT THEME ***
  static ThemeData lightTheme = ThemeData.light().copyWith(
    cardTheme:
        const CardTheme(color: LightColors.colorLight), // record card color
    canvasColor: LightColors.colorMedium, // inside the container color
    cardColor: LightColors.colorLight, // the container color
    scaffoldBackgroundColor: LightColors.colorBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: LightColors.colorBackground, // appBar backGround color
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
            LightColors.colorPrimary), // elevatedButton backGround color
        foregroundColor: WidgetStateProperty.all(
            LightColors.colorBackground), // elevatedButton foreGround color
        shadowColor: WidgetStateProperty.all(
            LightColors.colorPrimary), // elevatedButton shadow color
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: LightColors.colorPrimary,
          fontSize: 22,
          fontFamily: "outfit"), // text color
      bodyLarge: TextStyle(
          color: LightColors.colorText,
          fontSize: 16,
          fontFamily: "outfit"), // text color
      bodyMedium: TextStyle(
          color: LightColors.colorText,
          fontSize: 14,
          fontFamily: "outfit"), // text color
      bodySmall: TextStyle(
          color: LightColors.colorText,
          fontSize: 12,
          fontFamily: "outfit"), // text color
      displaySmall: TextStyle(
          color: LightColors.colorPrimary,
          fontSize: 28,
          fontFamily: "outfit"), // weight text color
      labelSmall: TextStyle(
          color: LightColors.colorPrimary,
          fontSize: 20,
          fontFamily: "outfit"), // object record weight color
    ),
    primaryColor: LightColors.colorPrimary, // neon color
    focusColor: LightColors.colorBottomBar, // bottom navigationBar color
    indicatorColor:
        LightColors.colorBottomBarIcons, // icon Color (navigationBar)
  );

  // *** DARK THEME *** DARK THEME *** DARK THEME *** DARK THEME *** DARK THEME *** DARK THEME *** DARK THEME *** DARK THEME ***
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    cardTheme:
        const CardTheme(color: DarkColors.colorDark), // record card color
    canvasColor: DarkColors.colorMedium, // inside the container color
    cardColor: DarkColors.colorDark, // the container color
    scaffoldBackgroundColor: DarkColors.colorbackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkColors.colorbackground, // appBar backGround color
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
            DarkColors.colorPrimary), // elevatedButton backGround color
        foregroundColor: WidgetStateProperty.all(
            DarkColors.colorbackground), // elevatedButton foreGround color
        shadowColor: WidgetStateProperty.all(
            DarkColors.colorPrimary), // elevatedButton shadow color
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: DarkColors.colorPrimary,
          fontSize: 22,
          fontFamily: "outfit"), // text color
      bodyLarge: TextStyle(
          color: DarkColors.colorText,
          fontSize: 16,
          fontFamily: "outfit"), // text color
      bodyMedium: TextStyle(
          color: DarkColors.colorText,
          fontSize: 14,
          fontFamily: "outfit"), // text color
      bodySmall: TextStyle(
          color: DarkColors.colorText,
          fontSize: 12,
          fontFamily: "outfit"), // text color
      displaySmall: TextStyle(
          color: DarkColors.colorPrimary,
          fontSize: 28,
          fontFamily: "outfit"), // weight text color
      labelSmall: TextStyle(
          color: DarkColors.colorPrimary,
          fontSize: 20,
          fontFamily: "outfit"), // object record weight color
    ),
    primaryColor: DarkColors.colorPrimary, // neon color
    focusColor: DarkColors.colorBottomBar, // bottom navigationBar color
    indicatorColor:
        DarkColors.colorBottomBarIcons, // icon Color (navigationBar)
  );
}

*/