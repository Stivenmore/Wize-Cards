import 'package:equatable/equatable.dart';
import 'package:wize_cards/data/models/badge_model.dart';

abstract class StatsState extends Equatable {
  const StatsState();

  @override
  List<Object?> get props => [];
}

/// Estado inicial antes de cargar datos.
class StatsInitial extends StatsState {}

/// Cargando datos de estadisticas.
class StatsLoading extends StatsState {}

/// Datos cargados exitosamente.
class StatsLoaded extends StatsState {
  final int weeklyActions;
  final int trendPercentage;
  final int cardsCollected;
  final int currentStreak;
  final List<int> weeklyData;
  final int currentDayIndex;
  final List<BadgeModel> badges;

  const StatsLoaded({
    required this.weeklyActions,
    required this.trendPercentage,
    required this.cardsCollected,
    required this.currentStreak,
    required this.weeklyData,
    required this.currentDayIndex,
    required this.badges,
  });

  @override
  List<Object?> get props => [
    weeklyActions,
    trendPercentage,
    cardsCollected,
    currentStreak,
    weeklyData,
    currentDayIndex,
    badges,
  ];
}

/// Error al cargar datos.
class StatsError extends StatsState {
  final String message;

  const StatsError(this.message);

  @override
  List<Object?> get props => [message];
}
