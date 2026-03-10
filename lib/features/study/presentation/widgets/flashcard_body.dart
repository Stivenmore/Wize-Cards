import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';

/// Molecula: Cuerpo de la flashcard con el termino principal y su categoria.
class FlashcardBody extends StatelessWidget {
  final String word;
  final String category;

  const FlashcardBody({
    super.key,
    required this.word,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: SpacingConstants.xs,
      children: [
        Text(
          word,
          style: GoogleFonts.lexend(
            fontSize: FlashcardConstants.wordFontSize,
            fontWeight: FontWeight.w700,
            color: ColorConstants.flashcardWord,
            height: FlashcardConstants.labelLineHeight /
                FlashcardConstants.wordFontSize,
            letterSpacing: FlashcardConstants.labelLetterSpacing,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          category,
          style: GoogleFonts.lexend(
            fontSize: FlashcardConstants.categoryFontSize,
            fontWeight: FontWeight.w700,
            color: ColorConstants.flashcardCategory,
            height: FlashcardConstants.labelLineHeight /
                FlashcardConstants.categoryFontSize,
            letterSpacing: FlashcardConstants.labelLetterSpacing,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
