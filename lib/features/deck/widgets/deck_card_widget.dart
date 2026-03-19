import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/deck/constanst/deck_screen_constant.dart';

class DeckCardWidget extends StatelessWidget {
  const DeckCardWidget({
    super.key,
    required this.title,
    required this.cardCount,
    required this.lastStudied,
    this.progress = 0.6,
    this.onTap,
    this.icon = Icons.work_outline,
    this.colorByModel,
  });

  final String title;
  final int cardCount;
  final String lastStudied;
  final double progress;
  final VoidCallback? onTap;
  final IconData icon;
  final String? colorByModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final normalizedProgress = progress.clamp(0.0, 1.0);
    final baseColor = _parseHexColor(colorByModel) ?? theme.primaryColor;
    final iconContainerColor = baseColor.withValues(alpha: 0.12);

    return Padding(
      padding: EdgeInsets.only(bottom: SpacingConstants.small),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BorderRadiusConstants.large),
        ),
        clipBehavior: Clip.antiAlias,
        shadowColor: theme.shadowColor,
        elevation: 1,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(BorderRadiusConstants.large),
          child: SizedBox(
            height: DeckScreenConstants.sizeCard,
            child: Column(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(SpacingConstants.medium),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: iconContainerColor,
                          borderRadius: BorderRadius.circular(
                            BorderRadiusConstants.medium,
                          ),
                        ),
                        child: SizedBox(
                          width: SizeConstants.cardSize,
                          height: SizeConstants.cardSize,
                          child: Icon(
                            icon,
                            color: baseColor,
                            size: IconSizeConstants.x32,
                          ),
                        ),
                      ),

                      const SizedBox(width: SpacingConstants.medium),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: TextSizeConstants.subtitle,
                              ),
                            ),
                            const SizedBox(height: SpacingConstants.small),

                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: SpacingConstants.small,
                                    vertical: SpacingConstants.zero,
                                  ),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.onSurface,
                                    borderRadius: BorderRadius.circular(
                                      BorderRadiusConstants.small,
                                    ),
                                  ),
                                  child: Text(
                                    '$cardCount ${DeckScreenConstants.cards}',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: TextSizeConstants.body,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: SpacingConstants.small),
                                Flexible(
                                  child: Text(
                                    '• ${DeckScreenConstants.lastStudied}: $lastStudied',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: TextSizeConstants.body,
                                      color: theme.textTheme.bodyMedium?.color
                                          ?.withValues(alpha: 0.7),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: SpacingConstants.small),

                      Icon(
                        Icons.chevron_right,
                        color: theme.colorScheme.secondary,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                LinearProgressIndicator(
                  minHeight: ThicknessConstans.md,
                  value: normalizedProgress,
                  backgroundColor: theme.colorScheme.onSurface,
                  valueColor: AlwaysStoppedAnimation<Color>(baseColor),
                  borderRadius: BorderRadius.circular(
                    BorderRadiusConstants.large,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color? _parseHexColor(String? hexColor) {
    if (hexColor == null || hexColor.trim().isEmpty) {
      return null;
    }

    final normalized = hexColor.trim().replaceAll('#', '');
    final withAlpha = normalized.length == 6 ? 'FF$normalized' : normalized;

    if (withAlpha.length != 8) {
      return null;
    }

    final value = int.tryParse(withAlpha, radix: 16);
    if (value == null) {
      return null;
    }

    return Color(value);
  }
}
