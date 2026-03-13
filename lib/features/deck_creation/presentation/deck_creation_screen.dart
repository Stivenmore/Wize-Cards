import 'package:flutter/material.dart';
import 'package:wize_cards/core/presentation/widgets/buttons/ds_text_button_widget.dart';
import 'package:wize_cards/core/presentation/widgets/inputs/ds_text_field.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/deck_creation/presentation/constants/deck_creation_constants.dart';
import 'package:wize_cards/features/deck_creation/presentation/widgets/add_card_modal_widget.dart';
import 'package:wize_cards/features/deck_creation/presentation/widgets/deck_card_item_widget.dart';
import 'package:wize_cards/features/deck_creation/presentation/widgets/deck_color_selector_widget.dart';

/// The screen used for creating a new deck of cards.
///
/// This screen allows users to input a deck title, select a theme color,
/// and add multiple cards (questions and answers) to the deck.
class DeckCreationScreen extends StatefulWidget {
  /// Creates a [DeckCreationScreen].
  const DeckCreationScreen({super.key});

  @override
  State<DeckCreationScreen> createState() => _DeckCreationScreenState();
}

class _DeckCreationScreenState extends State<DeckCreationScreen> {
  final TextEditingController _titleController = TextEditingController();
  Color _selectedColor = DeckCreationConstants.deckColors[3]; // Default to Blue

  // Mock list for demonstration purposes
  final List<Map<String, String>> _cards = [
    {'question': 'Stakeholder', 'answer': 'Parte interesada'},
    {'question': 'Shareholder', 'answer': 'Accionista'},
    {'question': 'Market share', 'answer': 'Cuota de mercado'},
  ];

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: ColorConstants.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            DeckCreationConstants.screenTitle,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: ColorConstants.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(SpacingConstants.large),
            child: Column(
              spacing: SpacingConstants.large,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  spacing: SpacingConstants.medium,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DSTextField(
                      controller: _titleController,
                      title: DeckCreationConstants.titleLabel,
                      hintText: DeckCreationConstants.titleHint,
                    ),
                    Text(
                      DeckCreationConstants.colorLabel,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.textPrimary,
                      ),
                    ),
                    DeckColorSelectorWidget(
                      colors: DeckCreationConstants.deckColors,
                      selectedColor: _selectedColor,
                      onColorSelected: (color) {
                        setState(() {
                          _selectedColor = color;
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  '${DeckCreationConstants.addedCardsLabel} (${_cards.length})',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.textPrimary,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _cards.length + 1,
                    itemBuilder: (context, index) {
                      if (index == _cards.length) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: SpacingConstants.medium,
                          ),
                          child: DSTextButtonWidget(
                            onPressed: () async {
                              final card = await AddCardModalWidget.show(
                                context,
                              );
                              if (card != null) {}
                            },
                            text: DeckCreationConstants.addCardButton,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: ColorConstants.primaryBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        );
                      }
                      final card = _cards[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: SpacingConstants.xs,
                        ),
                        child: DeckCardItemWidget(
                          question: card['question']!,
                          answer: card['answer']!,
                          onDiscard: () {},
                          onTap: () {},
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: SpacingConstants.small,
                    children: [
                      Text(
                        DeckCreationConstants.createDeckButton,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorConstants.primaryWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.check,
                        color: ColorConstants.primaryWhite,
                        size: IconSizeConstants.x24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
