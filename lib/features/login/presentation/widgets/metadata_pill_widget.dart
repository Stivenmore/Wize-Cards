import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';

class MetadataPillWidget extends StatelessWidget {
  final String text;

  const MetadataPillWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).hoverColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).hintColor,
          fontSize: TextSizeConstants.caption,
        ),
      ),
    );
  }
}
