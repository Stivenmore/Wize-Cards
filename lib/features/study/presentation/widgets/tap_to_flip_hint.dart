import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';

/// Atomo: Indicador "TAP TO FLIP" con icono de mano.
class TapToFlipHint extends StatelessWidget {
  const TapToFlipHint({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: SpacingConstants.xs,
      children: [
        Icon(
          Icons.touch_app_outlined,
          size: FlashcardConstants.volumeIconSize,
          color: ColorConstants.flashcardHint,
        ),
        Text(
          'TAP TO FLIP',
          style: GoogleFonts.lexend(
            fontSize: FlashcardConstants.labelFontSize,
            fontWeight: FontWeight.w700,
            color: ColorConstants.flashcardHint,
            height: FlashcardConstants.labelLineHeight /
                FlashcardConstants.labelFontSize,
            letterSpacing: FlashcardConstants.labelLetterSpacing,
          ),
        ),
      ],
    );
  }
}
