import 'package:flutter/material.dart';
import 'package:wize_cards/core/presentation/widgets/buttons/ds_circular_icon_button_widget.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/deck_creation/presentation/constants/deck_creation_constants.dart';

/// A custom card widget used to display individual cards within a deck.
///
/// Displays a question and answer string with a discard button.
/// Supports tapping via [InkWell] and shows ellipsis for long text.
class DeckCardItemWidget extends StatelessWidget {
  /// Creates a [DeckCardItemWidget].
  const DeckCardItemWidget({
    super.key,
    required this.question,
    required this.answer,
    required this.onDiscard,
    this.onTap,
  });

  /// The question text.
  final String question;

  /// The answer text.
  final String answer;

  /// Callback triggered when the discard button is pressed.
  final VoidCallback onDiscard;

  /// Optional callback triggered when the card is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        customBorder: Theme.of(context).cardTheme.shape,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: SpacingConstants.small,
            horizontal: SpacingConstants.medium,
          ),
          child: Row(
            spacing: SpacingConstants.medium,
            children: [
              Expanded(
                child: Text(
                  '${DeckCreationConstants.questionAbbreviation} $question / ${DeckCreationConstants.answerAbbreviation} $answer',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorConstants.textPrimary,
                  ),
                ),
              ),
              DsCircularIconButtonWidget.transparent(
                onPressed: onDiscard,
                icon: Icons.remove_circle_outline,
                primary: DeckCreationConstants.discardIconColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
