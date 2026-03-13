import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';

/// A widget that displays an icon inside a circular background with a tinted color.
///
/// The widget creates a circular shape around the provided [icon]. The background
/// color of the circle is automatically calculated by blending the provided [primary]
/// color with the background [Theme] surface color at an alpha of 0.2, using
/// [Color.lerp].
///
/// This creates a soft, tinted background effect without relying on opacity
/// or transparency.
class DeckIconWidget extends StatelessWidget {
  /// Creates a [DeckIconWidget].
  ///
  /// The [icon] and [primary] arguments must not be null.
  const DeckIconWidget({
    super.key,
    required this.icon,
    required this.primary,
    this.size,
  });

  /// The icon to be displayed inside the circular background.
  final IconData icon;

  /// The color used for the icon and as the base for the background tint.
  final Color primary;

  /// An optional size for the icon.
  final double? size;

  @override
  Widget build(BuildContext context) {
    final fallbackSurfaceColor = Theme.of(context).colorScheme.surface;
    final backgroundColor =
        Color.lerp(fallbackSurfaceColor, primary, 0.2) ?? Colors.transparent;

    return DecoratedBox(
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(SpacingConstants.medium),
        child: Icon(
          icon,
          color: primary,
          size: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
