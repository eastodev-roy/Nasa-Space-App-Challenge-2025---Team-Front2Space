import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF003B73), // Deep Ocean Blue
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF003B73), // Ocean Blue
    secondary: Color(0xFF00CFC1), // Aqua Green
    tertiary: Color(0xFFFF6F3C), // Coral Orange
    surface: Color(0xFF0A192F), // Dark Navy
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.inter(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(fontFamily: 'Roboto', color: Colors.white70),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF003B73),
    titleTextStyle: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFF6F3C),
  ),
);
