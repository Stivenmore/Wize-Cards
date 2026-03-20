import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wize_cards/core/presentation/widgets/buttons/ds_circular_icon_button_widget.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/core/utils/icon_deck_by_tags.dart';
import 'package:wize_cards/features/deck/bloc/deck_bloc.dart';
import 'package:wize_cards/features/deck/constanst/deck_screen_constant.dart';
import 'package:wize_cards/features/deck/widgets/deck_card_widget.dart';

class DeckScreen extends StatelessWidget {
  const DeckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DeckBloc()..add(const DeckRequestedEvent()),
      child: const DeckView(),
    );
  }
}

class DeckView extends StatelessWidget {
  const DeckView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingConstants.large,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        DeckScreenConstants.myLibraryTitle,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      DsCircularIconButtonWidget.transparent(
                        onPressed: () {},
                        icon: Icons.search,
                        primary: theme.colorScheme.secondary,
                        buttonSize: IconSizeConstants.x32,
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<DeckBloc, DeckState>(
                buildWhen: (preview, current) =>
                    preview.selectedFilter != current.selectedFilter,
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SpacingConstants.large,
                      vertical: SpacingConstants.small,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: SpacingConstants.xs,
                          children: List.generate(
                            DeckScreenConstants.filters.length,
                            (index) {
                              final filter = DeckScreenConstants.filters[index];
                              return ChoiceChip(
                                label: Text(filter),
                                selected: filter == state.selectedFilter,
                                onSelected: (value) {
                                  if (!value) return;
                                  context.read<DeckBloc>().add(
                                    DeckFilterChangeEvent(filter),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Divider(thickness: 1, color: theme.dividerColor),
              Expanded(
                child: BlocBuilder<DeckBloc, DeckState>(
                  builder: (context, state) {
                    if (state.status == DeckStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.status == DeckStatus.failure) {
                      return Center(child: Text(state.errorMessage ?? ''));
                    }

                    if (state.filteredDecks.isEmpty) {
                      return const Center(
                        child: Text(DeckScreenConstants.emptyStateMessage),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(SpacingConstants.small),
                      itemCount: state.filteredDecks.length,
                      itemBuilder: (context, index) {
                        final deck = state.filteredDecks[index];
                        return DeckCardWidget(
                          title: deck.title,
                          cardCount: deck.cards.length,
                          lastStudied: 'Today',
                          progress: 0.65,
                          icon: deckIconByTags(deck),
                          colorByModel: deck.colorHex,
                          onTap: () {},
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
