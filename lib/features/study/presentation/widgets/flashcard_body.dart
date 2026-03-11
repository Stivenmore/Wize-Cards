import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';

/// Molecula: Cuerpo de la flashcard con el termino principal y su categoria.
class FlashcardBody extends StatelessWidget {
  final String word;
  final String category;

  const FlashcardBody({
    super.key,
    required this.word,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: SpacingConstants.xs,
      children: [
        Text(
          word,
          style: textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          category,
          style: textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
