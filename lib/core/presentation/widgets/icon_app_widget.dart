import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:flutter_svg/svg.dart';

/// Visual style variants for [IconAppWidget].
enum IconAppType { filled, outlined }

/// Branded app icon container with optional style customization.
///
/// Displays one of the app SVG logos depending on [assetPath], wrapped in a
/// decorated box with configurable background, shadow, size, and border radius.
class IconAppWidget extends StatelessWidget {
  /// Creates an app icon widget.
  ///
  /// If [assetPath] is null, [IconAppType.outlined] is used.
  /// If [size] is null, the icon uses `64` logical pixels.
  /// If [borderRadius] is null, [BorderRadiusConstants.large] is used.
  ///
  /// Assertions:
  /// - [size] must be greater than `0` when provided.
  /// - [borderRadius] must be greater than or equal to `0` when provided.
  const IconAppWidget({
    super.key,
    this.backgroundColor,
    this.boxShadow,
    this.assetPath,
    this.size,
    this.borderRadius,
  }) : assert(size == null || size > 0),
       assert(borderRadius == null || borderRadius >= 0);

  /// Background color of the icon container.
  ///
  /// Defaults to `Theme.of(context).primaryColor`.
  final Color? backgroundColor;

  /// Optional shadow list applied to the icon container.
  final List<BoxShadow>? boxShadow;

  /// Icon style variant used to resolve the rendered SVG asset.
  ///
  /// `filled` uses [AppConstants.appLogoFilled], `outlined` uses
  /// [AppConstants.appLogo].
  final IconAppType? assetPath;

  /// Width and height for the rendered SVG icon.
  ///
  /// Defaults to `64` when null.
  final double? size;

  /// Border radius of the outer decorated container.
  ///
  /// Defaults to [BorderRadiusConstants.large] when null.
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveType = assetPath ?? IconAppType.outlined;
    final effectiveSize = size ?? 64;
    final effectiveBorderRadius = borderRadius ?? BorderRadiusConstants.large;
    final isFilled = effectiveType == IconAppType.filled;
    final logoAsset = switch (effectiveType) {
      IconAppType.filled => AppConstants.appLogoFilled,
      IconAppType.outlined => AppConstants.appLogo,
    };

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        color: backgroundColor ?? theme.primaryColor,
        boxShadow: boxShadow,
        border: isFilled
            ? Border.all(
                color: theme.highlightColor.withValues(alpha: 0.2),
                width: 1,
              )
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(SpacingConstants.large),
        child: SvgPicture.asset(
          logoAsset,
          width: effectiveSize,
          height: effectiveSize,
        ),
      ),
    );
  }
}
