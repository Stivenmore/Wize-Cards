import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';

/// A circular icon button widget with a simplified and consistent color scheme.
///
/// This widget uses a [primary] color as the foundation for its visual design.
///
/// The [primary] color dictates the icon's color, and by default, both the border
/// color (if it's a bordered button) and the foundation for the auto-calculated
/// [backgroundColor].
///
/// Use [DsCircularIconButtonWidget] for a button without a border.
/// Use [DsCircularIconButtonWidget.bordered] for a button with a border.
/// Use [DsCircularIconButtonWidget.transparent] for a button with no background
/// and where its size is equivalent to its icon size.
///
/// Color rules:
/// * If [backgroundColor] is omitted, it automatically calculates a background
///   color by blending the [primary] color with the theme's surface color at
///   20%, achieving a tinted effect without relying on transparency/opacity.
class DsCircularIconButtonWidget extends StatelessWidget {
  /// Creates a [DsCircularIconButtonWidget] without a border.
  ///
  /// The [onPressed], [icon], and [primary] arguments are required.
  const DsCircularIconButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.primary,
    this.buttonSize,
    this.backgroundColor,
    this.label,
    this.labelStyle,
    this.boxShadow,
  }) : hasBorder = false,
       borderWidth = 0.0,
       borderColor = null,
       _isTransparent = false;

  /// Creates a [DsCircularIconButtonWidget] with a border.
  ///
  /// The [onPressed], [icon], and [primary] arguments are required.
  /// If [borderColor] is not provided, the border uses the [primary] color.
  const DsCircularIconButtonWidget.bordered({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.primary,
    this.borderWidth = 3.0,
    this.buttonSize,
    this.borderColor,
    this.backgroundColor,
    this.label,
    this.labelStyle,
    this.boxShadow,
  }) : hasBorder = true,
       _isTransparent = false;

  /// Creates a [DsCircularIconButtonWidget] with a transparent background.
  ///
  /// It removes the background color and default padding, making the total
  /// size of the button equivalent to the size of the inner icon.
  const DsCircularIconButtonWidget.transparent({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.primary,
    this.buttonSize,
    this.label,
    this.labelStyle,
    this.boxShadow,
  }) : hasBorder = false,
       borderWidth = 0.0,
       borderColor = null,
       backgroundColor = Colors.transparent,
       _isTransparent = true;

  /// The callback that is called when the button is tapped.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onPressed;

  /// The icon to display inside the button.
  final IconData icon;

  /// The primary color used for the icon and as the default for the border
  /// and background tint.
  final Color primary;

  /// Whether the button should have a border.
  ///
  /// Automatically set to false by default, and true when using the
  /// `.bordered` constructor.
  final bool hasBorder;

  /// The width of the button's border.
  ///
  /// Defaults to 3.0 on the `.bordered` constructor.
  final double borderWidth;

  /// The overall size of the circular button.
  ///
  /// If provided, the [IconButton] will fix to this size, and its internal
  /// icon will proportionally adapt (e.g., half of the button size).
  final double? buttonSize;

  /// An optional override for the border color.
  ///
  /// If null and [hasBorder] is true, the border will use the [primary] color.
  final Color? borderColor;

  /// The background color of the button.
  ///
  /// If null, a color is automatically calculated by mixing the [primary]
  /// color with the theme's surface color to simulate a 20% opacity
  /// tint without actually using transparency.
  final Color? backgroundColor;

  /// An optional text label displayed below the button.
  final String? label;

  /// The text style applied to the optional [label].
  final TextStyle? labelStyle;

  /// An optional list of shadows applied behind the button.
  final List<BoxShadow>? boxShadow;

  /// Controls whether the button is built in transparent mode.
  final bool _isTransparent;

  @override
  Widget build(BuildContext context) {
    final Color fallbackSurfaceColor = Theme.of(context).colorScheme.surface;

    final Color resolvedBackgroundColor = _isTransparent
        ? Colors.transparent
        : (backgroundColor ??
              (Color.lerp(fallbackSurfaceColor, primary, 0.2) ??
                  Colors.transparent));

    final BorderSide borderSide = hasBorder
        ? BorderSide(color: borderColor ?? primary, width: borderWidth)
        : BorderSide.none;

    final double? internalIconSize = buttonSize != null
        ? (_isTransparent ? buttonSize : buttonSize! * 0.5)
        : null;

    Widget button = IconButton(
      onPressed: onPressed,
      iconSize: internalIconSize,
      icon: Icon(icon, color: primary),
      style: IconButton.styleFrom(
        fixedSize: buttonSize != null ? Size(buttonSize!, buttonSize!) : null,
        backgroundColor: resolvedBackgroundColor,
        side: borderSide,
        padding: _isTransparent ? EdgeInsets.zero : null,
      ),
    );

    if (boxShadow != null && boxShadow!.isNotEmpty) {
      button = DecoratedBox(
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: boxShadow),
        child: button,
      );
    }

    if (label != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          button,
          if (!_isTransparent) const SizedBox(height: SpacingConstants.small),
          Text(
            label!,
            style: labelStyle ?? Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    return button;
  }
}
