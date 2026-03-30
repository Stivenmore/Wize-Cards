import 'package:flutter/material.dart';
import 'package:wize_cards/features/stats/presentation/constants/stats_screen_constants.dart';
import 'package:wize_cards/features/stats/presentation/widgets/day_bar.dart';

/// Organismo: Grafico de barras semanal que muestra actividad por dia.
///
/// Recibe datos semanales y el indice del dia actual para resaltar
/// dias pasados vs futuros.
class WeeklyBarChart extends StatelessWidget {
  const WeeklyBarChart({
    required this.weeklyData,
    required this.currentDayIndex,
    super.key,
  });

  final List<int> weeklyData;
  final int currentDayIndex;

  static const _dayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: StatsScreenConstants.chartHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(weeklyData.length, (index) {
          return Expanded(
            child: DayBar(
              value: weeklyData[index],
              maxValue: StatsScreenConstants.barMaxActions,
              label: _dayLabels[index],
              isPast: index < currentDayIndex,
              isCurrentDay: index == currentDayIndex,
            ),
          );
        }),
      ),
    );
  }
}
