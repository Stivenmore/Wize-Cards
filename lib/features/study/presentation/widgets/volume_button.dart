import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';

/// Atomo: Boton de volumen con fondo circular para text-to-speech.
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
      child: Container(
        width: FlashcardConstants.volumeIconSize,
        height: FlashcardConstants.volumeIconSize,
        decoration: BoxDecoration(
          color: ColorConstants.volumeIcon.withValues(
            alpha: FlashcardConstants.volumeIconOpacity,
          ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            FlashcardConstants.volumeIconAsset,
            width: SizeConstants.iconSmall,
            height: SizeConstants.iconSmall,
          ),
        ),
      ),
    );
  }
}
