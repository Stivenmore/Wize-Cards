import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/stats/presentation/constants/stats_screen_constants.dart';

/// Molecula: Insignia de logro con estados unlocked/locked.
///
/// Muestra un circulo con fondo gradiente, borde coloreado, icono SVG
/// centrado y texto debajo. En estado locked, todo se muestra en tonos grises.
class AchievementBadge extends StatelessWidget {
  final String iconPath;
  final String label;
  final Color color;
  final List<Color> gradientColors;
  final bool isUnlocked;

  const AchievementBadge({
    super.key,
    required this.iconPath,
    required this.label,
    required this.color,
    required this.gradientColors,
    this.isUnlocked = true,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor =
        isUnlocked ? color : StatsScreenConstants.badgeBorderLocked;
    final iconColor =
        isUnlocked ? color : StatsScreenConstants.badgeIconLocked;
    final textColor = isUnlocked
        ? StatsScreenConstants.badgeTextUnlocked
        : StatsScreenConstants.badgeTextLocked;

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: SpacingConstants.small,
      children: [
        Container(
          width: StatsScreenConstants.badgeCircleSize,
          height: StatsScreenConstants.badgeCircleSize,
          decoration: BoxDecoration(
            gradient: isUnlocked
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: gradientColors,
                  )
                : null,
            color: isUnlocked ? null : StatsScreenConstants.badgeBackgroundLocked,
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor,
              width: StatsScreenConstants.badgeBorderWidth,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(
                    alpha: StatsScreenConstants.badgeShadowOpacity),
                blurRadius: StatsScreenConstants.badgeShadowBlur,
                offset: Offset(0, StatsScreenConstants.badgeShadowOffsetY),
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: StatsScreenConstants.badgeIconSize,
              height: StatsScreenConstants.badgeIconSize,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: textColor,
                fontSize: TextSizeConstants.caption,
                fontWeight: FontWeight.w600,
                height: 16.0 / 12.0,
                letterSpacing: 0,
              ),
        ),
      ],
    );
  }
}
