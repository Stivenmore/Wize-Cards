import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryColor = Color(0xFF1976D2); // Wize Blue
  static const scaffoldBackground = Color(0xFFF5F7FA); // Light Grey
  static const cardBackground = Colors.white; // White for cards

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      highlightColor: Colors.white,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        onSurface: scaffoldBackground,
      ),
      // Tipografía global lista
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        bodyMedium: GoogleFonts.inter(fontSize: 16, color: Colors.black54),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),

      // Estilo de tarjetas por defecto (Sombra suave)
      cardTheme: CardThemeData(
        elevation: 0,
        color: cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200),
        ),
      ),

      // Estilo de botones
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
