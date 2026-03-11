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
  final String word;
  final String category;
  final String badgeLabel;
  final VoidCallback? onTap;
  final VoidCallback? onVolumeTap;

  const FlashcardWidget({
    super.key,
    required this.word,
    required this.category,
    this.badgeLabel = 'TERM',
    this.onTap,
    this.onVolumeTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(
            left: StudyScreenConstants.flashcardPaddingHorizontal,
            right: StudyScreenConstants.flashcardPaddingHorizontal,
            top: StudyScreenConstants.flashcardPaddingTop,
            bottom: StudyScreenConstants.flashcardPaddingBottom,
          ),
          child: Column(
            children: [
              FlashcardHeader(
                badgeLabel: badgeLabel,
                onVolumeTap: onVolumeTap,
              ),
              Expanded(
                child: FlashcardBody(
                  word: word,
                  category: category,
                ),
              ),
              const TapToFlipHint(),
            ],
          ),
        ),
      ),
    );
  }
}
