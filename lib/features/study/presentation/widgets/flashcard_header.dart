import 'package:flutter/material.dart';
import 'package:wize_cards/features/study/presentation/widgets/term_badge.dart';
import 'package:wize_cards/features/study/presentation/widgets/volume_button.dart';

/// Molecula: Header de la flashcard con badge "TERM" y boton de volumen.
class FlashcardHeader extends StatelessWidget {
  final String badgeLabel;
  final VoidCallback? onVolumeTap;

  const FlashcardHeader({
    super.key,
    this.badgeLabel = 'TERM',
    this.onVolumeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TermBadge(label: badgeLabel),
        VolumeButton(onPressed: onVolumeTap),
      ],
    );
  }
}
