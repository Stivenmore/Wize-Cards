import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/features/search/presentation/contanstants/search_constants.dart';

/// A custom [ChoiceChip] widget for the discover section.
///
/// This widget provides consistent styling for choice chips used in the
/// search and discover features, automatically applying the correct
/// background and selected colors.
class DiscoverChoiceChipWidget extends StatelessWidget {
  /// Creates a discover choice chip widget.
  const DiscoverChoiceChipWidget({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  /// The widget displayed inside the chip.
  ///
  /// Typically a [Text] widget that displays the filter name.
  final Widget label;

  /// Whether or not this chip is currently selected.
  final bool selected;

  /// Called when the user selects or deselects the chip.
  final void Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: label,
      selected: selected,
      onSelected: onSelected,
      selectedColor: ColorConstants.textPrimary,
      backgroundColor: SearchConstants.choiceChipSelectedColor,
    );
  }
}
