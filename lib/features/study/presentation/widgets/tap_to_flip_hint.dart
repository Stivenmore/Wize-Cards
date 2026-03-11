import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';

/// Atomo: Indicador "TAP TO FLIP" con icono de mano/dedo.
class TapToFlipHint extends StatelessWidget {
  const TapToFlipHint({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: SpacingConstants.xs,
      children: [
        SvgPicture.asset(
          FlashcardConstants.touchIconAsset,
          height: FlashcardConstants.volumeIconSize,
          colorFilter: const ColorFilter.mode(
            ColorConstants.flashcardHint,
            BlendMode.srcIn,
          ),
        ),
        Text(
          'TAP TO FLIP',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ColorConstants.flashcardHint,
              ),
        ),
      ],
    );
  }
}
