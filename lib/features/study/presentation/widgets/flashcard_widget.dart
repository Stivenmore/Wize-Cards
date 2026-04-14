import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:wize_cards/features/study/presentation/constants/study_screen_constants.dart';
import 'package:wize_cards/features/study/presentation/widgets/flashcard_body.dart';
import 'package:wize_cards/features/study/presentation/widgets/flashcard_header.dart';
import 'package:wize_cards/features/study/presentation/widgets/tap_to_flip_hint.dart';

/// Organismo: Flashcard completa (lado frontal — TERM).
///
/// Muestra el header con badge y volumen, el termino con su categoria
/// centrado, y el hint "TAP TO FLIP" en el footer.
class FlashcardWidget extends StatelessWidget {
  final String frontText;
  final String backText;
  final String hint;
  final String badgeLabel;
  final VoidCallback? onTap;
  final VoidCallback? onVolumeTap;

  const FlashcardWidget({
    super.key,
    required this.frontText,
    required this.backText,
    this.hint = '',
    this.badgeLabel = 'TERM',
    this.onTap,
    this.onVolumeTap,
  });

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: _buildFaceCard(frontText, hint),
      back: _buildFaceCard(backText, ""),
    );
  }

  Widget _buildFaceCard(String text, String hint) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          left: StudyScreenConstants.flashcardPaddingHorizontal,
          right: StudyScreenConstants.flashcardPaddingHorizontal,
          top: StudyScreenConstants.flashcardPaddingTop,
          bottom: StudyScreenConstants.flashcardPaddingBottom,
        ),
        child: Column(
          children: [
            FlashcardHeader(badgeLabel: badgeLabel, onVolumeTap: onVolumeTap),
            Expanded(
              child: FlashcardBody(word: text, category: hint),
            ),
            const TapToFlipHint(),
          ],
        ),
      ),
    );
  }
}
