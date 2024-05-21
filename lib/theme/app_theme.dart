import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final lightTheme = ThemeData(
      primaryColor: const Color(0xE8241B4C),
      backgroundColor: Colors.blue[100],
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.oswald().copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
          color: const Color(0xE8241B4C),
        ),
      ));

  static final darkTheme = ThemeData(
    primaryColor: Colors.blue[100],
    backgroundColor: const Color(0xE8241B4C),
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.oswald().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
        color: Colors.blue[100],
      ),
    ),
  );
}
