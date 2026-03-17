import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/deck_details/presentation/widgets/deck_creator_avatar_widget.dart';
import 'package:wize_cards/features/deck_details/presentation/widgets/deck_oficial_badge.dart';
import 'package:wize_cards/features/search/presentation/widgets/deck_icon_widget.dart';

/// The header section of the Deck Details screen.
///
/// Displays the deck icon, title, verification badge, creator information,
/// and a brief description.
class DeckDetailsHeaderWidget extends StatelessWidget {
  /// Creates a [DeckDetailsHeaderWidget].
  const DeckDetailsHeaderWidget({
    super.key,
    required this.title,
    required this.creatorName,
    required this.description,
    required this.isVerified,
    required this.icon,
  });

  /// The title of the deck.
  final String title;

  /// The name of the creator.
  final String creatorName;

  /// The description of the deck.
  final String description;

  /// Whether the deck is official/verified.
  final bool isVerified;

  /// The icon to display for the deck.
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SpacingConstants.medium,
      children: [
        DeckIconWidget(
          icon: icon,
          primary: Theme.of(context).primaryColor,
          size: IconSizeConstants.x48,
          padding: const EdgeInsets.all(SpacingConstants.xLarge),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        if (isVerified) ...[const DeckOfficialBadge()],
        DeckCreatorAvatarWidget(creatorName: creatorName),
        const SizedBox(height: SpacingConstants.xs),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingConstants.medium,
          ),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: TextSizeConstants.body,
            ),
          ),
        ),
      ],
    );
  }
}
