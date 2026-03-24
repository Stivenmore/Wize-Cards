import 'package:flutter/material.dart';
import 'package:wize_cards/core/presentation/widgets/buttons/ds_circular_icon_button_widget.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/search/presentation/contanstants/search_constants.dart';

/// A custom text field widget designed for search functionality.
///
/// This widget displays a capsule-shaped text input field with a search icon
/// as a prefix and a customizable settings/filter button as a suffix.
/// It automatically adapts its background color based on the current theme's
/// brightness (light or dark mode).
class SearchTextfieldWidget extends StatelessWidget {
  /// Creates a [SearchTextfieldWidget].
  ///
  /// The [onSettingsPressed] callback is required and is triggered when the
  /// trailing settings button is tapped.
  const SearchTextfieldWidget({
    super.key,
    required this.onSettingsPressed,
    this.controller,
    this.onChanged,
  });

  /// The callback that is called when the trailing settings button is tapped.
  final VoidCallback onSettingsPressed;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController? controller;

  /// Called when the user initiates a change to the [TextField]'s value:
  /// when they have inserted or deleted text, or when they have submitted the text.
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode
        ? SearchConstants.searchBackgroundDark
        : SearchConstants.searchBackgroundLight;

    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onChanged,
      textInputAction: TextInputAction.search,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: SearchConstants.searchHint,
        filled: true,
        fillColor: backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search, color: ColorConstants.subtitle),
        suffixIcon: Padding(
          padding: EdgeInsets.only(
            right: SpacingConstants.medium,
            top: SpacingConstants.xs,
            bottom: SpacingConstants.xs,
          ),
          child: DsCircularIconButtonWidget(
            onPressed: onSettingsPressed,
            icon: Icons.tune,
            primary: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
