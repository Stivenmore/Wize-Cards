import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';

/// Atomo: Badge "TERM" con fondo azul claro y texto uppercase.
class TermBadge extends StatelessWidget {
  final String label;

  const TermBadge({
    super.key,
    this.label = 'TERM',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: FlashcardConstants.badgeHeight,
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingConstants.small,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.termBadgeBackground,
        borderRadius: BorderRadius.circular(FlashcardConstants.badgeRadius),
      ),
      alignment: Alignment.center,
      child: Text(
        label.toUpperCase(),
        style: GoogleFonts.lexend(
          fontSize: FlashcardConstants.labelFontSize,
          fontWeight: FontWeight.w700,
          color: ColorConstants.termBadgeText,
          height: FlashcardConstants.labelLineHeight /
              FlashcardConstants.labelFontSize,
          letterSpacing: FlashcardConstants.labelLetterSpacing,
        ),
      ),
    );
  }
}
