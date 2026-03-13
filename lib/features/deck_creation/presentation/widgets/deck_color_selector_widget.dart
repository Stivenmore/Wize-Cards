import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/deck_creation/presentation/constants/deck_creation_constants.dart';

/// A widget that allows users to select a color for their deck.
///
/// It displays a horizontal list of color circles that animate when selected.
class DeckColorSelectorWidget extends StatelessWidget {
  /// Creates a [DeckColorSelectorWidget].
  const DeckColorSelectorWidget({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onColorSelected,
  });

  /// The list of colors available for selection.
  final List<Color> colors;

  /// The currently selected color.
  final Color selectedColor;

  /// Callback triggered when a color is selected.
  final ValueChanged<Color> onColorSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: SpacingConstants.medium,
      runSpacing: SpacingConstants.medium,
      children: colors.map((color) {
        final isSelected = color.toARGB32() == selectedColor.toARGB32();
        return GestureDetector(
          onTap: () => onColorSelected(color),
          child: _AnimatedColorCircle(color: color, isSelected: isSelected),
        );
      }).toList(),
    );
  }
}

/// Private widget for the individual color circle with animation.
class _AnimatedColorCircle extends StatelessWidget {
  const _AnimatedColorCircle({required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AnimationConstants.fast,
      width: DeckCreationConstants.colorCircleSize,
      height: DeckCreationConstants.colorCircleSize,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: color, width: 3) : null,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isSelected)
            AnimatedScale(
              scale: isSelected ? 1.0 : 0.0,
              duration: AnimationConstants.fast,
              child: Container(
                width: DeckCreationConstants.colorCircleSize,
                height: DeckCreationConstants.colorCircleSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConstants.primaryWhite,
                    width: ThicknessConstans.sm,
                  ),
                ),
                child: const Icon(
                  Icons.check,
                  color: ColorConstants.primaryWhite,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
