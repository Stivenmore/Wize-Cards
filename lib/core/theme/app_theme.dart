import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';

class AppTheme {
  static const primaryColor = Color(0xFF1152D4); // Wize Blue

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: ColorConstants.primaryBlue,
      highlightColor: Colors.white,
      scaffoldBackgroundColor: ColorConstants.scaffoldBackground,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorConstants.primaryBlue,
        onSurface: ColorConstants.scaffoldBackground,
      ),
      shadowColor: primaryColor.withValues(alpha: 0.3),

      // Tipografia global
      textTheme: TextTheme(
        displayMedium: GoogleFonts.inter(
          fontSize: TextSizeConstants.displayMedium,
          fontWeight: FontWeight.w800,
          color: Colors.white,
          height: 1.2,
          letterSpacing: -1.0,
        ),
        // Onboarding titulo: Inter 30px Bold
        headlineLarge: GoogleFonts.inter(
          fontSize: TextSizeConstants.headlineLarge,
          fontWeight: FontWeight.w700,
          color: ColorConstants.textPrimary,
          height: 1.25,
          letterSpacing: -0.75,
        ),
        // Titulo general: Inter 24px Bold
        headlineMedium: GoogleFonts.inter(
          fontSize: TextSizeConstants.headline,
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
        bodySmall: GoogleFonts.inter(
          fontSize: TextSizeConstants.body,
          fontWeight: FontWeight.w400,
          color: ColorConstants.primaryWhite,
          wordSpacing: 0.35,
        ),
        // Descripcion: Inter 16px Regular
        bodyMedium: GoogleFonts.inter(
          fontSize: TextSizeConstants.bodyLarge,
          fontWeight: FontWeight.w400,
          color: ColorConstants.textSecondary,
          height: 1.625,
        ),
        // Label: Inter 14px SemiBold (botones, skip)
        labelLarge: GoogleFonts.inter(
          fontSize: TextSizeConstants.body,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        // Skip / label secundario: Inter 14px SemiBold
        labelMedium: GoogleFonts.inter(
          fontSize: TextSizeConstants.body,
          fontWeight: FontWeight.w600,
          color: ColorConstants.textSecondary,
          height: 1.43,
          letterSpacing: 0.35,
        ),
      ),

      // Estilo de tarjetas por defecto (Sombra suave)
      cardTheme: CardThemeData(
        elevation: 0,
        color: ColorConstants.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BorderRadiusConstants.large),
          side: BorderSide(color: Colors.grey.shade200),
        ),
      ),

      // Estilo de botones elevados
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.primaryBlue,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, SizeConstants.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BorderRadiusConstants.large),
          ),
        ),
      ),
    );
  }
}
