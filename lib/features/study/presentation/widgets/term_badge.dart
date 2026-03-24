import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/study/presentation/constants/study_screen_constants.dart';

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
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingConstants.small,
        vertical: SpacingConstants.xs,
      ),
      decoration: BoxDecoration(
        color: StudyScreenConstants.termBadgeBackground,
        borderRadius: BorderRadius.circular(StudyScreenConstants.badgeRadius),
      ),
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: StudyScreenConstants.termBadgeText,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
