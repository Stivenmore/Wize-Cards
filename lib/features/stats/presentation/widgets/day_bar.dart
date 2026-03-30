import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/stats/presentation/constants/stats_screen_constants.dart';

/// Atomo: Barra individual de un dia en el grafico semanal.
///
/// Muestra una barra proporcional al valor del dia con label debajo.
/// Dias pasados en azul fuerte, dias futuros en azul al 50%.
class DayBar extends StatelessWidget {
  const DayBar({
    required this.value,
    required this.maxValue,
    required this.label,
    required this.isPast,
    required this.isCurrentDay,
    super.key,
  });

  final int value;
  final int maxValue;
  final String label;
  final bool isPast;
  final bool isCurrentDay;

  @override
  Widget build(BuildContext context) {
    final fillRatio =
        maxValue > 0 ? (value.toDouble() / maxValue).clamp(0.0, 1.0) : 0.0;
    final barOpacity = isPast || isCurrentDay
        ? StatsScreenConstants.barActiveOpacity
        : StatsScreenConstants.barFutureOpacity;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final totalHeight = constraints.maxHeight;
              final fillHeight = totalHeight * fillRatio;

              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: ColorConstants.primaryBlue.withValues(
                        alpha: StatsScreenConstants.barBackgroundOpacity,
                      ),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(BorderRadiusConstants.medium),
                      ),
                    ),
                    child: const SizedBox.expand(),
                  ),
                  SizedBox(
                    height: fillHeight,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryBlue.withValues(
                          alpha: barOpacity,
                        ),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(BorderRadiusConstants.medium),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: SpacingConstants.small),
        Text(
          label,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: isCurrentDay
                    ? ColorConstants.textPrimary
                    : StatsScreenConstants.dayLabelColor,
              ),
        ),
      ],
    );
  }
}
