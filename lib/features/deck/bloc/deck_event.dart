part of 'deck_bloc.dart';

@immutable
sealed class DeckEvent {
  const DeckEvent();
}

final class DeckRequestedEvent extends DeckEvent {
  const DeckRequestedEvent();
}

final class DeckFilterChangeEvent extends DeckEvent {
  const DeckFilterChangeEvent(this.filter);

  final String filter;
}

final class DeckRefreshEvent extends DeckEvent {
  const DeckRefreshEvent();
}
