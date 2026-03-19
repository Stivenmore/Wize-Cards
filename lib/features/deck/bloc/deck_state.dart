part of 'deck_bloc.dart';

@immutable
final class DeckState {
  final DeckStatus status;
  final List<DeckModel> allDecks;
  final List<DeckModel> filteredDecks;
  final String selectedFilter;
  final String? errorMessage;

  const DeckState({
    required this.status,
    required this.allDecks,
    required this.filteredDecks,
    required this.selectedFilter,
    this.errorMessage,
  });

  factory DeckState.initial() {
    return const DeckState(
      status: DeckStatus.initial,
      allDecks: [],
      filteredDecks: [],
      selectedFilter: "All",
      errorMessage: null,
    );
  }

  DeckState copyWith({
    DeckStatus? status,
    List<DeckModel>? allDecks,
    List<DeckModel>? filteredDecks,
    String? selectedFilter,
    String? errorMessage,
  }) {
    return DeckState(
      status: status ?? this.status,
      allDecks: allDecks ?? this.allDecks,
      filteredDecks: filteredDecks ?? this.filteredDecks,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
