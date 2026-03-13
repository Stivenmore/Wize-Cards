import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';

class TitleSesionStateWdiget extends StatelessWidget {
  final String title;

  const TitleSesionStateWdiget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      fontSize: TextSizeConstants.caption,
      fontWeight: FontWeight.bold,
      color: ColorConstants.textPrimary,
    );

    return Column(
      mainAxisAlignment: .center,
      children: [
        Text(
          title.toUpperCase(),
          style: textStyle.copyWith(
            color: Theme.of(context).hintColor,
            letterSpacing: ThicknessConstans.xs,
          ),
        ),
        Row(
          mainAxisAlignment: .center,
          spacing: SpacingConstants.small,
          children: [
            SizedBox(
              width: SizeConstants.dots,
              height: SizeConstants.dots,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: ColorConstants.dotGreen,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Text(TextConstans.liveSession, style: textStyle),
          ],
        ),
      ],
    );
  }
}
