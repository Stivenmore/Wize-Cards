import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';

/// Atomo: Boton circular reutilizable para el header de pantallas.
class HeaderIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const HeaderIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: IconButton.styleFrom(
        backgroundColor: Theme.of(context).highlightColor,
        fixedSize: Size.square(SizeConstants.headerIconButton),
        minimumSize: Size.square(SizeConstants.headerIconButton),
        padding: EdgeInsets.zero,
        shape: CircleBorder(
          side: BorderSide(color: ColorConstants.borderLight),
        ),
      ),
    );
  }
}
