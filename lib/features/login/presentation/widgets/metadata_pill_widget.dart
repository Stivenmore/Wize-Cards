import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';

class MetadataPillWidget extends StatelessWidget {
  final String text;

  const MetadataPillWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).hoverColor,
        borderRadius: BorderRadius.circular(BorderRadiusConstants.small),
      ),
      child: Padding(
        padding: EdgeInsets.all(SpacingConstants.xs),
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: TextSizeConstants.caption,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
