import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';

/// Atomo: Boton de volumen para text-to-speech.
class VolumeButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const VolumeButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        Icons.volume_up_rounded,
        size: FlashcardConstants.volumeIconSize,
        color: ColorConstants.volumeIcon.withValues(
          alpha: FlashcardConstants.volumeIconOpacity,
        ),
      ),
    );
  }
}
