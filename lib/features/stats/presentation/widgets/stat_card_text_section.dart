import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/stats/presentation/constants/stats_screen_constants.dart';

/// Atomo: Seccion de texto de la tarjeta de estadistica.
///
/// Muestra un numero grande y un titulo descriptivo debajo.
class StatCardTextSection extends StatelessWidget {
  final int value;
  final String title;

  const StatCardTextSection({
    super.key,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value.toString(),
          style: textTheme.headlineLarge?.copyWith(
                fontSize: TextSizeConstants.displayMedium,
                fontWeight: FontWeight.w700,
                height: StatsScreenConstants.statCardNumberLineHeight /
                    TextSizeConstants.displayMedium,
                letterSpacing:
                    StatsScreenConstants.statCardNumberLetterSpacing,
              ),
        ),
        Text(
          title,
          style: textTheme.bodyMedium?.copyWith(
                fontSize: TextSizeConstants.body,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
              ),
        ),
      ],
    );
  }
}
