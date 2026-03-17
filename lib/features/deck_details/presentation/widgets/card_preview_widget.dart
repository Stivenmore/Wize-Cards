import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/deck_details/presentation/constants/deck_details_constants.dart';

/// A widget that displays a preview of a card with its term and definition.
///
/// This widget uses a [Card] with custom styling for the term and definition sections,
/// including a blue vertical indicator for the term.
class CardPreviewWidget extends StatelessWidget {
  /// Creates a [CardPreviewWidget].
  const CardPreviewWidget({
    super.key,
    required this.term,
    required this.definition,
  });

  /// The term or question of the card.
  final String term;

  /// The definition or answer of the card.
  final String definition;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(SpacingConstants.medium),
        child: Column(
          spacing: SpacingConstants.medium,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: SpacingConstants.small,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: DeckDetailsConstants.termIndicatorColor,
                    borderRadius: BorderRadius.circular(
                      BorderRadiusConstants.small,
                    ),
                  ),
                  child: SizedBox(width: 3, height: 32),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: SpacingConstants.xs,
                    children: [
                      Text(
                        DeckDetailsConstants.termLabel,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: TextSizeConstants.caption,
                        ),
                      ),
                      Text(
                        term,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(color: Theme.of(context).dividerColor),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: SpacingConstants.xs,
              children: [
                Text(
                  DeckDetailsConstants.definitionLabel,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: TextSizeConstants.caption,
                  ),
                ),
                Text(
                  definition,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: TextSizeConstants.body,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
