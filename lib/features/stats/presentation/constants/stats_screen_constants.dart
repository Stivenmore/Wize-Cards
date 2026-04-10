import 'dart:ui';

/// Constantes especificas del feature de estadisticas.
abstract class StatsScreenConstants {
  // --- Trend pill ---
  static const String trendUpIcon = 'assets/images/icons/trend-up-icon.svg';
  static const Color trendPositiveColor = Color(0xFF16A34A);
  static const Color trendPositiveBackground = Color(0xFFF0FDF4);

  // --- Spacing de la pantalla ---
  static const double chartToCardsSpacing = 35.0;
  static const double chartInternalTopPadding = 40.0;

  // --- Weekly bar chart ---
  static const double chartHeight = 128.0;
  static const int barMaxActions = 20;
  static const double barActiveOpacity = 1.0;
  static const double barFutureOpacity = 0.5;
  static const double barBackgroundOpacity = 0.1;
  static const Color dayLabelColor = Color(0xFF94A3B8);

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

  // --- Colores de iconos de stat cards ---
  static const Color fireIconColor = Color(0xFFF97316);

  // --- Textos ---
  static const String myProgressLabel = 'My Progress';
  static const String weeklyActivityLabel = 'Weekly Activity';
  static const String actionsLabel = 'actions';
  static const String recentBadgesLabel = 'Recent Badges';
  static const String viewAllLabel = 'View All';
  static const String cardsCollectedLabel = 'Cards Collected';
  static const String dayStreakLabel = 'Day Streak';
}
