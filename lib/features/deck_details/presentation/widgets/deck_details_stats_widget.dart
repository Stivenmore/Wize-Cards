import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/deck_details/presentation/constants/deck_details_constants.dart';

/// A widget that displays a single stat (value, label, icon) for the deck.
class DeckStatItemWidget extends StatelessWidget {
  /// Creates a [DeckStatItemWidget].
  const DeckStatItemWidget({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  /// The icon representing the stat.
  final IconData icon;

  /// The value of the stat (e.g., "50", "EN-US").
  final String value;

  /// The label for the stat (e.g., "CARDS", "LANGUAGE").
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SpacingConstants.small,
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.secondary),
        Text(value, style: Theme.of(context).textTheme.titleSmall),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: TextSizeConstants.caption,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

/// A widget that displays a row of deck statistics.
class DeckDetailsStatsWidget extends StatelessWidget {
  /// Creates a [DeckDetailsStatsWidget].
  const DeckDetailsStatsWidget({
    super.key,
    required this.cardCount,
    required this.language,
    required this.formattedUpdateDate,
  });

  /// The number of cards in the deck.
  final int cardCount;

  /// The language code of the deck.
  final String language;

  /// The formatted relative time since the last update.
  final String formattedUpdateDate;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: DeckStatItemWidget(
              icon: Icons.layers_outlined,
              value: cardCount.toString(),
              label: DeckDetailsConstants.cardsLabel,
            ),
          ),
          VerticalDivider(color: Theme.of(context).dividerColor),
          Expanded(
            child: DeckStatItemWidget(
              icon: Icons.public_outlined,
              value: language.toUpperCase(),
              label: DeckDetailsConstants.languageLabel,
            ),
          ),
          VerticalDivider(color: Theme.of(context).dividerColor),
          Expanded(
            child: DeckStatItemWidget(
              icon: Icons.access_time_outlined,
              value: formattedUpdateDate,
              label: DeckDetailsConstants.updatedLabel,
            ),
          ),
        ],
      ),
    );
  }
}
