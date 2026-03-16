import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/stats/presentation/constants/stats_screen_constants.dart';

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
    return Container(
      height: StatsScreenConstants.statCardHeight,
      decoration: BoxDecoration(
        color: ColorConstants.cardBackground,
        borderRadius:
            BorderRadius.circular(StatsScreenConstants.statCardRadius),
        border: Border.all(
          color: StatsScreenConstants.statCardBorder,
          width: StatsScreenConstants.statCardBorderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
                alpha: StatsScreenConstants.statCardShadowOpacity),
            blurRadius: StatsScreenConstants.statCardShadowBlur,
            offset: Offset(0, StatsScreenConstants.statCardShadowOffsetY),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(StatsScreenConstants.statCardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconPill(),
                _buildTextSection(context),
              ],
            ),
          ),
          Positioned(
            right: StatsScreenConstants.statCardPadding,
            top: SpacingConstants.small,
            child: SvgPicture.asset(
              iconPath,
              width: StatsScreenConstants.statCardBackgroundIconSize,
              height: StatsScreenConstants.statCardBackgroundIconSize,
              colorFilter: ColorFilter.mode(
                iconColor.withValues(
                    alpha: StatsScreenConstants.statCardIconOpacity),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconPill() {
    return Container(
      width: StatsScreenConstants.statCardIconPillWidth,
      height: StatsScreenConstants.statCardIconPillHeight,
      decoration: BoxDecoration(
        color: iconColor
            .withValues(alpha: StatsScreenConstants.statCardIconOpacity),
        borderRadius: BorderRadius.circular(BorderRadiusConstants.circular),
      ),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          width: SizeConstants.iconSmall,
          height: SizeConstants.iconSmall,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      ),
    );
  }

  Widget _buildTextSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: ColorConstants.textPrimary,
                fontSize: TextSizeConstants.displayMedium,
                fontWeight: FontWeight.w700,
                height: StatsScreenConstants.statCardNumberLineHeight /
                    TextSizeConstants.displayMedium,
                letterSpacing: StatsScreenConstants.statCardNumberLetterSpacing,
              ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorConstants.textSecondary,
                fontSize: TextSizeConstants.body,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
              ),
        ),
      ],
    );
  }
}
