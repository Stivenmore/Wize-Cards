import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/study/presentation/constants/study_screen_constants.dart';

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
          AppConstants.touchIcon,
          height: StudyScreenConstants.volumeIconSize,
          colorFilter: const ColorFilter.mode(
            StudyScreenConstants.flashcardHint,
            BlendMode.srcIn,
          ),
        ),
        Text(
          StudyScreenConstants.tapToFlipLabel,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: StudyScreenConstants.flashcardHint,
              ),
        ),
      ],
    );
  }
}
