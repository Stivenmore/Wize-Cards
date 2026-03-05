import 'package:flutter/material.dart';

class OrDividerWidget extends StatelessWidget {
  final String text;
  final double thickness;
  final Color? dividerColor;
  final TextStyle? textStyle;

  const OrDividerWidget({
    super.key,
    this.text = 'OR',
    this.thickness = 1,
    this.dividerColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveDividerColor =
        dividerColor ?? Theme.of(context).dividerColor;

    final TextStyle effectiveTextStyle =
        textStyle ?? Theme.of(context).textTheme.bodySmall!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Divider(thickness: thickness, color: effectiveDividerColor),
          ),
          SizedBox(width: 18),
          Text(text, style: effectiveTextStyle),
          SizedBox(width: 18),
          Expanded(
            child: Divider(thickness: thickness, color: effectiveDividerColor),
          ),
        ],
      ),
    );
  }
}
