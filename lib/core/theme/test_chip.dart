import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';

final theme = ThemeData(
  chipTheme: ChipThemeData(
    labelStyle: WidgetStateTextStyle.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const TextStyle(color: ColorConstants.primaryWhite);
      }
      return const TextStyle();
    }),
  ),
);
