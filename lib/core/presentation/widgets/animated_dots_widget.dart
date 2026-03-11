import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';

/// A widget that renders three dots with a staggered fade animation,
/// typically used as a loading indicator.
///
/// Each dot fades in and out sequentially, creating a looping pulse effect.
/// Customize [dotColor], [dotSize] and [spacing] as needed.
class AnimatedDotsWidget extends StatefulWidget {
  const AnimatedDotsWidget({
    super.key,
    this.dotColor = ColorConstants.primaryWhite,
    this.dotSize = 10.0,
    this.spacing = 8.0,
  });

  /// Color of each dot. Defaults to white.
  final Color dotColor;

  /// Diameter of each dot. Defaults to `10`.
  final double dotSize;

  /// Space between dots. Defaults to `8`.
  final double spacing;

  @override
  State<AnimatedDotsWidget> createState() => _AnimatedDotsWidgetState();
}

class _AnimatedDotsWidgetState extends State<AnimatedDotsWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // Each dot uses a staggered interval so they pulse one after another.
  late final Animation<double> _dot1;
  late final Animation<double> _dot2;
  late final Animation<double> _dot3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _dot1 = _buildDotAnimation(0.0, 0.33);
    _dot2 = _buildDotAnimation(0.2, 0.53);
    _dot3 = _buildDotAnimation(0.4, 0.73);
  }

  /// Builds a looping fade animation for a single dot within the given
  /// [begin]–[end] interval of the parent [_controller] timeline.
  ///
  /// The dot pulses from opacity `0.3` → `1.0` → `0.3` using
  /// [Curves.easeIn] and [Curves.easeOut] respectively.
  Animation<double> _buildDotAnimation(double begin, double end) {
    return TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.3,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 0.3,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
    ]).animate(
      // Interval already uses Curves.linear by default — no extra
      // CurvedAnimation wrapper needed.
      CurvedAnimation(parent: _controller, curve: Interval(begin, end)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: widget.spacing,
      children: [
        _Dot(animation: _dot1, size: widget.dotSize, color: widget.dotColor),
        _Dot(animation: _dot2, size: widget.dotSize, color: widget.dotColor),
        _Dot(animation: _dot3, size: widget.dotSize, color: widget.dotColor),
      ],
    );
  }
}

/// A single animated dot driven by an [Animation<double>] opacity value.
///
/// Uses [color] with a dynamic alpha instead of an [Opacity] widget to avoid
/// an extra compositing layer, keeping the render tree lighter.
class _Dot extends AnimatedWidget {
  const _Dot({
    required Animation<double> animation,
    required this.size,
    required this.color,
  }) : super(listenable: animation);

  /// Diameter of the dot in logical pixels.
  final double size;

  /// Base color of the dot. Alpha is driven by the animation value.
  final Color color;

  @override
  Widget build(BuildContext context) {
    final opacity = (listenable as Animation<double>).value;
    return DecoratedBox(
      decoration: BoxDecoration(
        // Baking opacity into the color avoids a separate Opacity render object.
        color: color.withValues(alpha: opacity),
        shape: BoxShape.circle,
      ),
      child: SizedBox.square(dimension: size),
    );
  }
}
