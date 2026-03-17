import 'package:flutter/material.dart';

/// Constants for the Add New Card feature and modal.
abstract class AddCardConstants {
  static const String modalTitle = 'Add New Card';
  static const String frontLabel = 'Front (Question)';
  static const String backLabel = 'Back (Answer)';
  static const String addToDeckButton = 'Add to Deck';
  static const String frontHint = 'e.g., What is a Stakeholder?';
  static const String backHint =
      'e.g., Anyone interested in the project outcome';

  static const IconData frontIcon = Icons.web_asset;
  static const IconData backIcon = Icons.copy_all_rounded;
}
