import 'dart:ui';

/// Constantes especificas del feature de estudio (flashcard).
abstract class StudyScreenConstants {
  // --- Colores ---
  static const Color termBadgeBackground = Color(0xFFE0EEFF);
  static const Color termBadgeText = Color(0xFF1152D4);
  static const Color flashcardWord = Color(0xFF1152D4);
  static const Color flashcardCategory = Color(0xFFA3A3A3);
  static const Color flashcardHint = Color(0xFFC7C3C3);
  static const Color volumeIconBackground = Color(0xFFEDEDED);
  static const Color gotItButton = Color(0xFF22C55E);
  static const Color missedButton = Color(0xFFEF4444);
  static const Color undoButton = Color(0xFF94A3B8);

  // --- Tamanios ---
  static const double badgeRadius = 4.0;
  static const double badgeHeight = 19.0;
  static const double volumeIconSize = 28.0;
  static const double volumeIconOpacity = 0.54;

  // --- Padding de flashcard ---
  static const double flashcardPaddingHorizontal = 21.0;
  static const double flashcardPaddingTop = 23.0;
  static const double flashcardPaddingBottom = 37.0;

  // --- Assets ---
  static const String volumeHighIcon = 'assets/images/icons/volume-high.svg';
  static const String touchIcon = 'assets/images/icons/touch-icon.svg';

  // --- Textos ---
  static const String tapToFlipLabel = 'TAP TO FLIP';
  static const String gotItLabel = "Got it";
  static const String missedLabel = "Missed";
  static const String undoLabel = "Undo";
  static const String noCardsMessage = "No hay cartas disponibles";
}
