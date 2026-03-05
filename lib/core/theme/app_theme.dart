import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wize_cards/core/utils/constant.dart';

class AppTheme {
  static const primaryColor = Color(0xFF1152D4); // Wize Blue
  static const scaffoldBackground = Color(0xFFF5F7FA); // Light Grey
  static const cardBackground = Colors.white; // White for cards
  static const secondaryTextColor = Color(0xFFD8D8DA); // Light grey for secondary text
  static const dividercolor = Color(0xFFD8D8DA); // Light grey for divider

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      highlightColor: Colors.white,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        onSurface: scaffoldBackground,
      ),
      shadowColor: primaryColor.withValues(alpha: 0.3),
      // Tipografía global lista
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 40,
          fontWeight: FontWeight.w800,
          color: primaryColor,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: ColorConstants.subtitle,
        ),
        bodyMedium: GoogleFonts.inter(fontSize: 16, color: Colors.black54),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodySmall: GoogleFonts.inter(fontSize: 14, color: secondaryTextColor),
      ),

      // Color general para divider
      dividerColor: dividercolor,

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
