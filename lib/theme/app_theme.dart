import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFF8A46D8); // purple used in design
  static const Color accent = Color(0xFFB682F0);
  static const double cardRadius = 28.0;

  static ThemeData light() {
    return ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
            fontSize: 20, fontWeight: FontWeight.w600, color: primary),
        bodyMedium: GoogleFonts.poppins(fontSize: 14, color: Colors.black87),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle:
              GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
