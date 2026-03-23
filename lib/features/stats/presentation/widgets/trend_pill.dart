import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/stats/presentation/constants/stats_screen_constants.dart';


/// Atomo: Pill que muestra una tendencia porcentual con icono y texto.
class TrendPill extends StatelessWidget {
  const TrendPill({
    required this.percentage,
    super.key,
  });

  final int percentage;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: StatsScreenConstants.trendPositiveBackground,
        borderRadius: BorderRadius.circular(BorderRadiusConstants.small),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: SpacingConstants.xs,
          horizontal: SpacingConstants.small,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: SpacingConstants.xs,
          children: [
            SvgPicture.asset(
              StatsScreenConstants.trendUpIcon,
              colorFilter: const ColorFilter.mode(
                StatsScreenConstants.trendPositiveColor,
                BlendMode.srcIn,
              ),
            ),
            Text(
              '+$percentage%',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: StatsScreenConstants.trendPositiveColor,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
