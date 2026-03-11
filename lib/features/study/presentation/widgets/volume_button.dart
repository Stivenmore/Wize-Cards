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
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        FlashcardConstants.volumeIconAsset,
        width: SizeConstants.iconSmall,
        height: SizeConstants.iconSmall,
      ),
      style: IconButton.styleFrom(
        backgroundColor: ColorConstants.volumeIcon.withValues(
          alpha: FlashcardConstants.volumeIconOpacity,
        ),
        fixedSize: Size.square(FlashcardConstants.volumeIconSize),
        minimumSize: Size.square(FlashcardConstants.volumeIconSize),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
