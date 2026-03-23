import 'dart:ui';

/// Constantes especificas del feature de estadisticas.
abstract class StatsScreenConstants {
  // --- Trend pill ---
  static const String trendUpIcon = 'assets/images/icons/trend-up-icon.svg';
  static const Color trendPositiveColor = Color(0xFF16A34A);
  static const Color trendPositiveBackground = Color(0xFFF0FDF4);

  // --- Shadow del badge (specs unicas de este feature) ---
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
