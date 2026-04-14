import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:go_router/go_router.dart';
import 'package:wize_cards/core/presentation/widgets/buttons/ds_circular_icon_button_widget.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/data/models/deck_model.dart';
import 'package:wize_cards/features/deck/bloc/deck_bloc.dart';
import 'package:wize_cards/features/deck/widgets/study_header_widget.dart';
import 'package:wize_cards/features/study/presentation/constants/study_screen_constants.dart';
import 'package:wize_cards/features/study/presentation/widgets/flashcard_widget.dart';

class StudyModeScreen extends StatefulWidget {
  final String deckId;
  const StudyModeScreen({super.key, required this.deckId});

  @override
  State<StudyModeScreen> createState() => _StudyModeScreenState();
}

class _StudyModeScreenState extends State<StudyModeScreen> {
  final CardSwiperController _controller = CardSwiperController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => DeckBloc()..add(DeckByIdEvent(widget.deckId)),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                _buildProgressHeader(),
                _buildCardSwipper(),
                _buildButtonsRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingConstants.large),
      child: SizedBox(
        width: double.infinity,
        height: SizeConstants.deckHeaderSize,
        child: BlocBuilder<DeckBloc, DeckState>(
          builder: (BuildContext context, DeckState state) {
            if (state.filteredDecks.isNotEmpty) {
              final DeckModel deck = state.filteredDecks.first;
              return StudyHeaderWidget(
                progress: 1,
                maxValue: deck.cards.length.toDouble(),
                onBackPressed: () {
                  context.pop();
                },
                onSettingsPressed: () {},
              );
            } else {
              return StudyHeaderWidget(
                progress: 0,
                maxValue: 0,
                onBackPressed: () {
                  context.pop();
                },
                onSettingsPressed: () {},
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildCardSwipper() {
    return Expanded(
      child: BlocBuilder<DeckBloc, DeckState>(
        builder: (BuildContext context, DeckState state) {
          if (state.filteredDecks.isNotEmpty) {
            final DeckModel deck = state.filteredDecks.first;
            return CardSwiper(
              controller: _controller,
              cardsCount: deck.cards.length,
              numberOfCardsDisplayed: 3,
              backCardOffset: const Offset(0, 10),
              allowedSwipeDirection: AllowedSwipeDirection.only(
                left: true,
                right: true,
              ),
              cardBuilder:
                  (
                    context,
                    index,
                    horizontalThresholdPercentage,
                    verticalThresholdPercentage,
                  ) {
                    final card = deck.cards[index];
                    return FlashcardWidget(
                      frontText: card.front,
                      backText: card.back,
                      hint: card.hint,
                    );
                  },
              onEnd: () {
                Center(child: Text(StudyScreenConstants.noCardsMessage));
              },
            );
          } else {
            return const Center(
              child: Text(StudyScreenConstants.noCardsMessage),
            );
          }
        },
      ),
    );
  }

  Widget _buildButtonsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingConstants.large),
      child: SizedBox(
        width: double.infinity,
        height: SizeConstants.deckButtonsHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionColumn(
              icon: Icons.close,
              label: StudyScreenConstants.missedLabel,
              color: StudyScreenConstants.missedButton,
              isBordered: true,
              onPressed: () => _controller.swipe(CardSwiperDirection.left),
            ),
            _buildActionColumn(
              icon: Icons.history,
              label: StudyScreenConstants.undoLabel,
              color: StudyScreenConstants.undoButton,
              onPressed: () {},
            ),
            _buildActionColumn(
              icon: Icons.done,
              label: StudyScreenConstants.gotItLabel,
              color: StudyScreenConstants.gotItButton,
              isBordered: true,
              onPressed: () => _controller.swipe(CardSwiperDirection.right),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionColumn({
    required IconData icon,
    required String label,
    required Color color,
    bool isBordered = false,
    required VoidCallback? onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isBordered)
          DsCircularIconButtonWidget.bordered(
            icon: icon,
            primary: color,
            onPressed: onPressed,
            buttonSize: SizeConstants.buttonHeight,
          )
        else
          DsCircularIconButtonWidget(
            icon: icon,
            primary: color,
            onPressed: onPressed,
          ),
        const SizedBox(height: SpacingConstants.small),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: StudyScreenConstants.undoButton,
          ),
        ),
      ],
    );
  }
}
