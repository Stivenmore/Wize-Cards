import 'dart:ui';

/// Constantes especificas del feature de estadisticas.
abstract class StatsScreenConstants {
  // --- Colores del badge ---
  static const Color badgeTextUnlocked = Color(0xFF334155);
  static const Color badgeBackgroundLocked = Color(0xFFF8FAFC);
  static const Color badgeBorderLocked = Color(0xFFE2E8F0);
  static const Color badgeIconLocked = Color(0xFFCBD5E1);
  static const Color badgeTextLocked = Color(0xFF94A3B8);

  // --- Tamanios del badge ---
  static const double badgeCircleSize = 64.0;
  static const double badgeBorderWidth = 2.0;
  static const double badgeIconSize = 28.0;

  // --- Shadow del badge ---
  static const double badgeShadowBlur = 2.0;
  static const double badgeShadowOffsetY = 1.0;
  static const double badgeShadowOpacity = 0.05;

  // --- Opacidad de la stat card ---
  static const double statCardIconOpacity = 0.1;

  // --- Shadow de la stat card ---
  static const double statCardShadowBlur = 8.0;
  static const double statCardShadowOffsetY = 2.0;
  static const double statCardShadowOpacity = 0.04;

  // --- Tipografia de la stat card ---
  static const double statCardNumberLetterSpacing = -0.9;
  static const double statCardNumberLineHeight = 40.0;
}
