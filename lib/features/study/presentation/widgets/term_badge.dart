import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingConstants.small,
        vertical: SpacingConstants.xs,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.termBadgeBackground,
        borderRadius: BorderRadius.circular(FlashcardConstants.badgeRadius),
      ),
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: ColorConstants.termBadgeText,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
