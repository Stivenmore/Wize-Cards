import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';

class DSTextButtonWidget extends StatelessWidget {
  const DSTextButtonWidget({
    super.key,
    this.padding = EdgeInsets.zero,
    this.size = Size.zero,
    required this.onPressed,
    required this.text,
    this.style,
  });

  final EdgeInsets padding;
  final Size size;
  final VoidCallback onPressed;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final style = 
      this.style ?? 
      TextStyle(
        color: ColorConstants.subtitle,
        fontSize: TextSizeConstants.caption,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.bold,
      );
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: Text(text, style: style),
    );
  }
}