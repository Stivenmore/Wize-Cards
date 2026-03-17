import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/deck_details/presentation/constants/deck_details_constants.dart';

class DeckOfficialBadge extends StatelessWidget {
  const DeckOfficialBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final fallbackSurfaceColor = Theme.of(context).colorScheme.surface;
    final primary = Theme.of(context).primaryColor;
    final verifiedBadgeColor = Color.lerp(fallbackSurfaceColor, primary, 0.2);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: verifiedBadgeColor,
        borderRadius: BorderRadius.circular(BorderRadiusConstants.circular),
        border: Border.all(color: Theme.of(context).primaryColor, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingConstants.twelve,
          vertical: SpacingConstants.xs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: Theme.of(context).primaryColor,
              size: IconSizeConstants.x16,
            ),
            const SizedBox(width: SpacingConstants.small),
            Text(
              DeckDetailsConstants.verifiedBadge,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
