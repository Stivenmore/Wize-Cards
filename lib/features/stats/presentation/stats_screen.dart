import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:wize_cards/features/stats/presentation/bloc/stats_event.dart';
import 'package:wize_cards/features/stats/presentation/bloc/stats_state.dart';
import 'package:wize_cards/features/stats/presentation/constants/stats_screen_constants.dart';
import 'package:wize_cards/features/stats/presentation/widgets/recent_badges_section.dart';
import 'package:wize_cards/features/stats/presentation/widgets/stat_card.dart';
import 'package:wize_cards/features/stats/presentation/widgets/weekly_activity_section.dart';
import 'package:wize_cards/features/stats/presentation/widgets/weekly_bar_chart.dart';

/// Organismo: Pantalla principal de estadisticas "My Progress".
///
/// Provee el StatsBloc al arbol de widgets y dispara el evento inicial
/// de carga. El bloc vive solo mientras la pantalla este activa.
class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StatsBloc>(
      create: (_) => StatsBloc()..add(StatsLoadRequested()),
      child: const StatsView(),
    );
  }
}

class StatsView extends StatelessWidget {
  const StatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackground,
      body: SafeArea(
        child: BlocBuilder<StatsBloc, StatsState>(
          builder: (context, state) {
            if (state is StatsLoading || state is StatsInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is StatsError) {
              return Center(child: Text(state.message));
            }

            if (state is StatsLoaded) {
              return _buildContent(context, state);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, StatsLoaded state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingConstants.large,
        vertical: SpacingConstants.large,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StatsScreenConstants.myProgressLabel,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: SpacingConstants.large),
          WeeklyActivitySection(
            weeklyActions: state.weeklyActions,
            trendPercentage: state.trendPercentage,
          ),
          SizedBox(height: SpacingConstants.large),
          WeeklyBarChart(
            weeklyData: state.weeklyData,
            currentDayIndex: state.currentDayIndex,
          ),
          SizedBox(height: StatsScreenConstants.chartToCardsSpacing),
          Row(
            spacing: SpacingConstants.small,
            children: [
              Expanded(
                child: StatCard(
                  value: state.cardsCollected,
                  title: StatsScreenConstants.cardsCollectedLabel,
                  iconPath: AppConstants.phoneIcon,
                  iconColor: ColorConstants.primaryBlue,
                ),
              ),
              Expanded(
                child: StatCard(
                  value: state.currentStreak,
                  title: StatsScreenConstants.dayStreakLabel,
                  iconPath: AppConstants.fireIcon,
                  iconColor: StatsScreenConstants.fireIconColor,
                ),
              ),
            ],
          ),
          SizedBox(height: SpacingConstants.xLarge),
          RecentBadgesSection(badges: state.badges),
        ],
      ),
    );
  }
}
