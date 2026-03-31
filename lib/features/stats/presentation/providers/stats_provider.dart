import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/data/models/badge_model.dart';

class StatsProvider extends ChangeNotifier {
  int weeklyActions = 24;
  int trendPercentage = 12;
  int cardsCollected = 120;
  int currentStreak = 5;

  List<int> weeklyData = [12, 8, 18, 5, 24, 4, 2];

  int get currentDayIndex => DateTime.now().weekday - 1;

  List<BadgeModel> badges = [
    const BadgeModel(
      iconPath: AppConstants.starterIcon,
      label: 'Starter',
      color: ColorConstants.primaryBlue,
      gradientColors: [Color(0xFFDBEAFE), Color(0xFFEFF6FF)],
      isUnlocked: true,
    ),
    const BadgeModel(
      iconPath: AppConstants.socialIcon,
      label: 'Social',
      color: ColorConstants.dotGreen,
      gradientColors: [Color(0xFFDCFCE7), Color(0xFFF0FDF4)],
      isUnlocked: true,
    ),
    const BadgeModel(
      iconPath: AppConstants.masterIcon,
      label: 'Master',
      color: ColorConstants.iconDisabled,
      gradientColors: [
        ColorConstants.backgroundLightGrey,
        ColorConstants.backgroundLightGrey,
      ],
    ),
  ];
}
