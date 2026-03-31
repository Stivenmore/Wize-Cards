import 'package:equatable/equatable.dart';

abstract class StatsEvent extends Equatable {
  const StatsEvent();

  @override
  List<Object?> get props => [];
}

/// Carga inicial de los datos de estadisticas.
class StatsLoadRequested extends StatsEvent {}

/// Refresca los datos de estadisticas.
class StatsRefreshRequested extends StatsEvent {}
