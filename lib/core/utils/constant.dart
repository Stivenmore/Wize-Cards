abstract class AppConstants {
  static const String appName = 'WizeCards';
  static const String appVersion = '1.0.0';
  static const String apiBaseUrl = 'https://api.wizecards.com';
  static const String supportEmail = 'support@wizecards.com';
  static const String appLogo = 'assets/images/branding/logo.svg';
  static const String appLogoFilled = 'assets/images/branding/logo-filled.svg';
  static const String googleLogo = 'assets/images/icons/google-icon.svg';
  static const String backIcon = 'assets/images/icons/back-button.svg';
  static const String settingsIcon = 'assets/images/icons/settings-icon.svg';
  static const String volumeHighIcon = 'assets/images/icons/volume-high.svg';
  static const String touchIcon = 'assets/images/icons/touch-icon.svg';
}

abstract class BorderRadiusConstants {
  static const double small = 4.0;
  static const double medium = 8.0;
  static const double large = 16.0;
  static const double xLarge = 24.0;
  static const double circular = 100.0;
}

abstract class SpacingConstants {
  static const double xs = 4.0;
  static const double small = 8.0;
  static const double twelve = 12.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double xLarge = 32.0;
  static const double xxLarge = 48.0;
}

abstract class TextSizeConstants {
  static const double caption = 12.0;
  static const double body = 14.0;
  static const double bodyLarge = 16.0;
  static const double subtitle = 18.0;
  static const double title = 20.0;
  static const double headline = 24.0;
  static const double headlineLarge = 30.0;
  static const double display = 32.0;
  static const double displayMedium = 36.0;
}

abstract class SizeConstants {
  static const double dots = 8.0;
  static const double buttonHeight = 52.0;
  static const double buttonMinWidth = 108.0;
  static const double iconSmall = 18.0;
  static const double headerIconButton = 48.0;
}

abstract class AnimationConstants {
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
}

abstract class OnboardingConstants {
  /// Ratio de altura de imagen para páginas estándar (1 y 3)
  static const double standardImageHeightRatio = 0.55;

  /// Ratio de altura de imagen para la página central (2)
  static const double expandedImageHeightRatio = 0.65;

  /// Ancho del dot indicator activo
  static const double dotActiveWidth = 32.0;

  /// Tamaño del dot indicator (alto e inactivo ancho)
  static const double dotSize = 10.0;
}

abstract class IconSizeConstants {
  static const double x69 = 69.0;
  static const double x64 = 64.0;
  static const double x48 = 48.0;
  static const double x32 = 32.0;
  static const double x24 = 24.0;
  static const double x18 = 18.0;
  static const double x16 = 16.0;
}
