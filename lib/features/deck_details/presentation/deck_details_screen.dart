import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/core/utils/date_extension.dart';
import 'package:wize_cards/features/deck_details/presentation/constants/deck_details_constants.dart';
import 'package:wize_cards/features/deck_details/presentation/widgets/card_preview_widget.dart';
import 'package:wize_cards/features/deck_details/presentation/widgets/deck_details_header_widget.dart';
import 'package:wize_cards/features/deck_details/presentation/widgets/deck_details_stats_widget.dart';

/// Data model for card preview information.
class CardPreviewData {
  /// Creates [CardPreviewData].
  const CardPreviewData({required this.term, required this.definition});

  /// The term of the card.
  final String term;

  /// The definition of the card.
  final String definition;
}

/// The screen detailing a specific card deck.
///
/// Displays deck metadata, statistics, and a preview of its cards.
class DeckDetailsScreen extends StatelessWidget {
  /// Creates a [DeckDetailsScreen].
  const DeckDetailsScreen({
    super.key,
    required this.lastEdited,
    required this.cardCount,
    required this.language,
    required this.createdBy,
    required this.title,
    required this.description,
    this.cards = const [],
  });

  /// The date when the deck was last edited.
  final DateTime lastEdited;

  /// Total number of cards in the deck.
  final int cardCount;

  /// The primary language of the deck.
  final String language;

  /// The name of the deck creator.
  final String createdBy;

  /// The title of the deck.
  final String title;

  /// The description of the deck.
  final String description;

  /// The list of cards in the deck.
  final List<CardPreviewData> cards;

  @override
  Widget build(BuildContext context) {
    // Limit preview to the first two items
    final previewCards = cards.take(2).toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingConstants.large,
                ),
                child: Column(
                  spacing: SpacingConstants.large,
                  children: [
                    DeckDetailsHeaderWidget(
                      icon: Icons.work_outline,
                      title: title,
                      creatorName: createdBy,
                      description: description,
                      isVerified: true,
                    ),
                    DeckDetailsStatsWidget(
                      cardCount: cardCount,
                      language: language,
                      formattedUpdateDate: lastEdited.toRelativeTime(),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Theme.of(context).dividerColor,
                height: SpacingConstants.xxLarge,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingConstants.large,
                ),
                child: Column(
                  spacing: SpacingConstants.medium,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DeckDetailsConstants.cardsPreviewHeadline,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(DeckDetailsConstants.viewAll),
                        ),
                      ],
                    ),
                    ...previewCards.map(
                      (card) => CardPreviewWidget(
                        term: card.term,
                        definition: card.definition,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: SpacingConstants.large),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).dividerColor,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(SpacingConstants.large),
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: SpacingConstants.small,
                children: [
                  Icon(
                    Icons.file_download_outlined,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  Text(
                    DeckDetailsConstants.downloadDeck,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
