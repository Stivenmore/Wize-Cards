import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/study/presentation/constants/study_screen_constants.dart';

/// Atomo: Boton de volumen con fondo circular para text-to-speech.
class VolumeButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const VolumeButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        AppConstants.volumeHighIcon,
        width: IconSizeConstants.x18,
        height: IconSizeConstants.x18,
      ),
      style: IconButton.styleFrom(
        backgroundColor: StudyScreenConstants.volumeIconBackground.withValues(
          alpha: StudyScreenConstants.volumeIconOpacity,
        ),
        fixedSize: Size.square(StudyScreenConstants.volumeIconSize),
        minimumSize: Size.square(StudyScreenConstants.volumeIconSize),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
