import 'package:flutter/material.dart';
import 'package:wize_cards/core/presentation/widgets/buttons/ds_circular_icon_button_widget.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/search/presentation/widgets/deck_icon_widget.dart';

/// A card widget displaying a deck discovery option.
///
/// This widget incorporates a [DeckIconWidget] for visual identification,
/// a title, a subtitle, and a download action [DsCircularIconButtonWidget].
/// The card is interactive and supports tap events via [onTap].
///
/// Ensures standardized [SpacingConstants.twelve] padding and spacing
/// between elements as defined by the application's design system.
/// The title is restricted to a maximum of 2 lines.
class DiscoverDeckCardWidget extends StatelessWidget {
  /// Creates a [DiscoverDeckCardWidget].
  const DiscoverDeckCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.onTap,
    required this.onDownload,
  });

  /// The main title of the deck card.
  ///
  /// Restricted to a maximum of 2 lines.
  final String title;

  /// The secondary text or subtitle displayed below the title.
  final String subtitle;

  /// The icon representing the deck category or type.
  final IconData icon;

  /// The color used for the [icon] and its automatically generated background tint.
  final Color iconColor;

  /// The callback that is called when the card is tapped.
  final VoidCallback onTap;

  /// The callback that is called when the download button is tapped.
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shadowColor: Theme.of(context).shadowColor.withValues(alpha: 0.06),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BorderRadiusConstants.large),
        side: BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(SpacingConstants.medium),
                child: Column(
                  spacing: SpacingConstants.twelve,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DeckIconWidget(icon: icon, primary: iconColor),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.displaySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: SpacingConstants.small,
              right: SpacingConstants.small,
              child: DsCircularIconButtonWidget(
                onPressed: onDownload,
                icon: Icons.download,
                primary: Theme.of(context).primaryColor,
                buttonSize: IconSizeConstants.x32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
