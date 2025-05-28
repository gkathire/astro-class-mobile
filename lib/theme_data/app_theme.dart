import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData tempMailTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFFf4f7fb),
    primaryColor: const Color(0xFF527CFF),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1B263B),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF527CFF),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF1B263B),
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF415A77)),
      ),
      labelStyle: TextStyle(color: Color(0xFFE0E1DD)),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF415A77)),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Color(0xFF527CFF),
      secondary: Color(0xFF415A77),
      error: Color(0xFFD62828),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
    ),
  );
}
