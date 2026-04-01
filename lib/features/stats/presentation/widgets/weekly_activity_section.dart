import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/stats/presentation/constants/stats_screen_constants.dart';
import 'package:wize_cards/features/stats/presentation/widgets/trend_pill.dart';

/// Molecula: Seccion de actividad semanal.
///
/// Muestra el subtitulo "Weekly Activity", el numero de acciones
/// y el indicador de tendencia porcentual.
class WeeklyActivitySection extends StatelessWidget {
  const WeeklyActivitySection({
    required this.weeklyActions,
    required this.trendPercentage,
    super.key,
  });

  final int weeklyActions;
  final int trendPercentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StatsScreenConstants.weeklyActivityLabel,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              SizedBox(height: SpacingConstants.xs),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                spacing: SpacingConstants.small,
                children: [
                  Text(
                    '$weeklyActions',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    StatsScreenConstants.actionsLabel,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        TrendPill(percentage: trendPercentage),
      ],
    );
  }
}
