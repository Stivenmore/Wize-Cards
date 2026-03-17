import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/stats/presentation/constants/stats_screen_constants.dart';
import 'package:wize_cards/features/stats/presentation/widgets/stat_card_text_section.dart';

/// Molecula: Tarjeta de estadistica simple.
///
/// Muestra un numero grande con texto descriptivo e iconos decorativos.
/// Usado para "Cards Collected" y "Day Streak" en la Stats Page.
class StatCard extends StatelessWidget {
  final int value;
  final String title;
  final String iconPath;
  final Color iconColor;

  const StatCard({
    super.key,
    required this.value,
    required this.title,
    required this.iconPath,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConstants.cardHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorConstants.cardBackground,
          borderRadius:
              BorderRadius.circular(BorderRadiusConstants.mediumLarge),
          border: Border.all(
            color: ColorConstants.cardBorder,
            width: ThicknessConstans.xs,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withValues(
                  alpha: StatsScreenConstants.statCardShadowOpacity),
              blurRadius: StatsScreenConstants.statCardShadowBlur,
              offset:
                  Offset(0, StatsScreenConstants.statCardShadowOffsetY),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(BorderRadiusConstants.mediumLarge),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(SpacingConstants.twenty),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconPill(),
                    StatCardTextSection(
                      value: value,
                      title: title,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: SpacingConstants.twenty,
                top: SpacingConstants.small,
                child: SvgPicture.asset(
                  iconPath,
                  width: IconSizeConstants.x50,
                  height: IconSizeConstants.x50,
                  colorFilter: ColorFilter.mode(
                    iconColor.withValues(
                        alpha: StatsScreenConstants.statCardIconOpacity),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconPill() {
    return SizedBox(
      width: SizeConstants.pillWidth,
      height: SizeConstants.pillHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: iconColor.withValues(
              alpha: StatsScreenConstants.statCardIconOpacity),
          borderRadius:
              BorderRadius.circular(BorderRadiusConstants.circular),
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: SizeConstants.iconSmall,
            height: SizeConstants.iconSmall,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
