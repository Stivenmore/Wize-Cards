import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/deck_details/presentation/constants/deck_details_constants.dart';

/// A widget that displays the deck creator's avatar and name.
class DeckCreatorAvatarWidget extends StatelessWidget {
  /// Creates a [DeckCreatorAvatarWidget].
  const DeckCreatorAvatarWidget({
    super.key,
    required this.creatorName,
    this.avatarUrl,
  });

  /// The name of the creator.
  final String creatorName;

  /// The URL of the avatar image.
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: SpacingConstants.small,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundImage: NetworkImage(
            avatarUrl ?? 'https://i.pravatar.cc/150?u=$creatorName',
          ),
        ),
        Text(
          "${DeckDetailsConstants.createdByLabel} $creatorName",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w500,
            fontSize: TextSizeConstants.body,
          ),
        ),
      ],
    );
  }
}
