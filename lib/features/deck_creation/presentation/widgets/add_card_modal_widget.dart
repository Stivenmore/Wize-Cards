import 'package:flutter/material.dart';
import 'package:wize_cards/core/presentation/widgets/inputs/ds_text_field.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/deck_creation/presentation/constants/add_card_constants.dart';

/// A modal bottom sheet widget for adding a new card to a deck.
///
/// This widget provides two multiline text fields for the front (question)
/// and back (answer) of a card, and a primary button to confirm addition.
class AddCardModalWidget extends StatefulWidget {
  /// Creates an [AddCardModalWidget].
  const AddCardModalWidget({super.key, required this.onAdd});

  /// Callback triggered when the "Add to Deck" button is pressed.
  ///
  /// Returns a map with 'question' and 'answer' keys.
  final ValueChanged<Map<String, String>> onAdd;

  /// Static method to show this modal bottom sheet.
  static Future<Map<String, String>?> show(BuildContext context) {
    return showModalBottomSheet<Map<String, String>>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: SpacingConstants.large),
        child: AddCardModalWidget(
          onAdd: (card) => Navigator.pop(context, card),
        ),
      ),
    );
  }

  @override
  State<AddCardModalWidget> createState() => _AddCardModalWidgetState();
}

class _AddCardModalWidgetState extends State<AddCardModalWidget> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  @override
  void dispose() {
    _questionController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_questionController.text.isNotEmpty &&
        _answerController.text.isNotEmpty) {
      widget.onAdd({
        'question': _questionController.text,
        'answer': _answerController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: SpacingConstants.large,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AddCardConstants.modalTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          // Form fields
          DSTextField.multiline(
            controller: _questionController,
            title: AddCardConstants.frontLabel,
            hintText: AddCardConstants.frontHint,
            iconTitle: AddCardConstants.frontIcon,
          ),
          DSTextField.multiline(
            controller: _answerController,
            title: AddCardConstants.backLabel,
            hintText: AddCardConstants.backHint,
            iconTitle: AddCardConstants.backIcon,
          ),
          const SizedBox(height: SpacingConstants.xs),
          ElevatedButton(
            onPressed: _handleSubmit,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: SpacingConstants.small,
              children: [
                const Icon(
                  Icons.add_circle_outline,
                  color: ColorConstants.primaryWhite,
                  size: IconSizeConstants.x24,
                ),
                Text(
                  AddCardConstants.addToDeckButton,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorConstants.primaryWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
