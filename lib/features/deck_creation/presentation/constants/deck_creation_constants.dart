import 'package:flutter/material.dart';

/// Constants for the Deck Creation feature.
///
/// This class contains labels and the color list used in the "New Deck" screen.
abstract class DeckCreationConstants {
  static const String screenTitle = 'New Deck';
  static const String questionAbbreviation = 'Q:';
  static const String answerAbbreviation = 'A:';

  static const String titleLabel = 'Title';

  static const String colorLabel = 'Deck Color';

  static const String addedCardsLabel = 'Added Cards';

  static const String addCardButton = '+ Add Card';

  static const String createDeckButton = 'Create Deck';

  static const String titleHint = 'e.g., Spanish Vocabulary';
  static const double colorCircleSize = 44.0;
  static const List<Color> deckColors = [
    Color(0xFFF84C44),
    Color(0xFFFFA500),
    Color(0xFF00B171),
    Color(0xFF1673D0),
    Color(0xFF6366F1),
    Color(0xFF8B5CF6),
    Color(0xFFEC4899),
  ];

  static const Color discardIconColor = Color(0xFFABB5BE);
}
