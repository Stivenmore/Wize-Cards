// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';
import 'package:wize_cards/data/models/deck_model.dart';

part 'deck_event.dart';
part 'deck_state.dart';

enum DeckStatus { initial, loading, success, failure }

class DeckBloc extends Bloc<DeckEvent, DeckState> {
  DeckBloc() : super(DeckState.initial()) {
    on<DeckRequestedEvent>(_onDeckRequested);
    on<DeckByIdEvent>(_onDeckById);
    on<DeckFilterChangeEvent>(_onDeckFilterChange);
    on<DeckRefreshEvent>(_onDeckRefresh);
  }

  Future<void> _onDeckRequested(
    DeckRequestedEvent event,
    Emitter<DeckState> emit,
  ) async {
    emit(state.copyWith(status: DeckStatus.loading));

    try {
      emit(state.copyWith(status: DeckStatus.loading));

      final jsonString = await rootBundle.loadString(
        'assets/data/initial_decks.json',
      );

      final List<dynamic> jsonList = json.decode(jsonString);

      final fetchedDecks = jsonList
          .map((json) => DeckModel.fromJson(json as Map<String, dynamic>))
          .toList();

      emit(
        state.copyWith(
          status: DeckStatus.success,
          allDecks: fetchedDecks,
          filteredDecks: fetchedDecks,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DeckStatus.failure,
          errorMessage: 'Failed to load decks',
        ),
      );
    }
  }

  Future<void> _onDeckById(DeckByIdEvent event, Emitter<DeckState> emit) async {
    emit(state.copyWith(status: DeckStatus.loading));
    try {
      final jsonString = await rootBundle.loadString(
        'assets/data/initial_decks.json',
      );

      final List<dynamic> jsonList = json.decode(jsonString);

      final fetchedDecks = jsonList
          .map((json) => DeckModel.fromJson(json as Map<String, dynamic>))
          .toList();

      final deck = fetchedDecks.firstWhere((deck) => deck.id == event.deckId);
      emit(
        state.copyWith(
          status: DeckStatus.success,
          allDecks: [deck],
          filteredDecks: [deck],
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DeckStatus.failure,
          errorMessage: 'Failed to load decks',
        ),
      );
    }
  }

  Future<void> _onDeckFilterChange(
    DeckFilterChangeEvent event,
    Emitter<DeckState> emit,
  ) async {
    if (event.filter == "All") {
      emit(
        state.copyWith(
          filteredDecks: state.allDecks,
          selectedFilter: event.filter,
        ),
      );
    } else {
      final filtered = state.allDecks
          .where((deck) => deck.category == event.filter)
          .toList();

      emit(
        state.copyWith(filteredDecks: filtered, selectedFilter: event.filter),
      );
    }
  }

  Future<void> _onDeckRefresh(
    DeckRefreshEvent event,
    Emitter<DeckState> emit,
  ) async {
    emit(state.copyWith(status: DeckStatus.loading));

    try {
      final jsonString = await rootBundle.loadString(
        'assets/data/initial_decks.json',
      );

      final List<dynamic> jsonList = json.decode(jsonString);

      final fetchedDecks = jsonList
          .map((json) => DeckModel.fromJson(json as Map<String, dynamic>))
          .toList();

      emit(
        state.copyWith(
          status: DeckStatus.success,
          allDecks: fetchedDecks,
          filteredDecks: fetchedDecks,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DeckStatus.failure,
          errorMessage: 'Failed to refresh decks',
        ),
      );
    }
  }
}
