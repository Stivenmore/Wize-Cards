/// Constantes especificas del feature de estadisticas.
/// Solo contiene valores unicos de este feature (shadows, opacidades, tipografia).
abstract class StatsScreenConstants {
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
