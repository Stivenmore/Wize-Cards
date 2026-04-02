import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/study/presentation/constants/study_screen_constants.dart';

/// Molecula: Barra de progreso dinamica que muestra el avance del usuario
/// en el mazo actual. Incluye el label "Progress", el contador "X / Y"
/// y una barra lineal con llenado proporcional.
class ProgressBar extends StatelessWidget {
  const ProgressBar({
    required this.currentCard,
    required this.totalCards,
    super.key,
  });

  final int currentCard;
  final int totalCards;

  @override
  Widget build(BuildContext context) {
    final double progress = totalCards > 0
        ? (currentCard / totalCards).clamp(0.0, 1.0)
        : 0.0;
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: SpacingConstants.xs,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StudyScreenConstants.progressLabel,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: ColorConstants.textMuted,
              ),
            ),
            Text(
              '$currentCard / $totalCards',
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: ColorConstants.primaryBlue,
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(BorderRadiusConstants.circular),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: StudyScreenConstants.progressBarHeight,
            backgroundColor: ColorConstants.borderLightGray,
            valueColor: const AlwaysStoppedAnimation<Color>(
              ColorConstants.primaryBlue,
            ),
          ),
        ),
      ],
    );
  }
}
