import 'package:flutter/material.dart';

/// Colores del sistema de diseno de Figma.
/// Estos colores se utilizan en [AppTheme] para resolver dark/light mode.
abstract class ColorConstants {
  // Primarios
  static const Color primaryWhite = Color(0xFFFFFFFF);
  static const Color primaryBlue = Color(0xFF1673D0);
  static const Color primaryBlueShadow = Color(0xFF3B82F6);

  // Texto
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color subtitle = Color(0xFF64748B);
  static const Color blueNavy = Color(0xFF334155);

  // Indicadores
  static const Color dotActive = Color(0xFF1673D0);
  static const Color dotInactive = Color(0xFFE2E8F0);
  static const Color dotGreen = Color(0xFF4CAF50);

  // Bordes
  static const Color borderLight = Color(0xFFD1D5DB);
  static const Color borderLightGray = Color(0xFFE2E8F0);

  // Fondos
  static const Color scaffoldBackground = Color(0xFFF5F7FA);
  static const Color cardBackground = Colors.white;
}
