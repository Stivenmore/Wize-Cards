import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/data/models/badge_model.dart';
import 'package:wize_cards/features/stats/presentation/bloc/stats_event.dart';
import 'package:wize_cards/features/stats/presentation/bloc/stats_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc() : super(StatsInitial()) {
    on<StatsLoadRequested>(_onLoadRequested);
    on<StatsRefreshRequested>(_onRefreshRequested);
  }

  Future<void> _onLoadRequested(
    StatsLoadRequested event,
    Emitter<StatsState> emit,
  ) async {
    emit(StatsLoading());
    emit(_loadMockData());
  }

  Future<void> _onRefreshRequested(
    StatsRefreshRequested event,
    Emitter<StatsState> emit,
  ) async {
    emit(StatsLoading());
    emit(_loadMockData());
  }

  /// Datos mock. Sera reemplazado por un UseCase cuando exista la API.
  StatsLoaded _loadMockData() {
    return StatsLoaded(
      weeklyActions: 24,
      trendPercentage: 12,
      cardsCollected: 120,
      currentStreak: 5,
      weeklyData: const [12, 8, 18, 5, 24, 4, 2],
      currentDayIndex: DateTime.now().weekday - 1,
      badges: const [
        BadgeModel(
          iconPath: AppConstants.starterIcon,
          label: 'Starter',
          color: ColorConstants.primaryBlue,
          gradientColors: [Color(0xFFDBEAFE), Color(0xFFEFF6FF)],
          isUnlocked: true,
        ),
        BadgeModel(
          iconPath: AppConstants.socialIcon,
          label: 'Social',
          color: ColorConstants.dotGreen,
          gradientColors: [Color(0xFFDCFCE7), Color(0xFFF0FDF4)],
          isUnlocked: true,
        ),
        BadgeModel(
          iconPath: AppConstants.masterIcon,
          label: 'Master',
          color: ColorConstants.iconDisabled,
          gradientColors: [
            ColorConstants.backgroundLightGrey,
            ColorConstants.backgroundLightGrey,
          ],
        ),
      ],
    );
  }
}
