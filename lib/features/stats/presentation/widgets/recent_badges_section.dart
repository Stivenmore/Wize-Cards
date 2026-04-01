import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/data/models/badge_model.dart';
import 'package:wize_cards/features/stats/presentation/constants/stats_screen_constants.dart';
import 'package:wize_cards/features/stats/presentation/widgets/achievement_badge.dart';

/// Organismo: Seccion de badges recientes.
///
/// Muestra el titulo "Recent Badges" con boton "View All"
/// y una fila de badges de logros.
class RecentBadgesSection extends StatelessWidget {
  const RecentBadgesSection({required this.badges, super.key});

  final List<BadgeModel> badges;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StatsScreenConstants.recentBadgesLabel,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                StatsScreenConstants.viewAllLabel,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: SpacingConstants.small),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: badges
              .map(
                (badge) => AchievementBadge(
                  iconPath: badge.iconPath,
                  label: badge.label,
                  color: badge.color,
                  gradientColors: badge.gradientColors,
                  isUnlocked: badge.isUnlocked,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
