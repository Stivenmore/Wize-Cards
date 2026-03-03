import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:flutter_svg/svg.dart';

class IconAppWidget extends StatelessWidget {
  const IconAppWidget({super.key, this.backgroundColor, this.boxShadow});

  /// [backgroundColor] default is using Theme primary Color
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusConstants.large),
        color: backgroundColor ?? Theme.of(context).primaryColor,
        boxShadow: boxShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(SpacingConstants.large),
        child: SvgPicture.asset(AppConstants.appLogo),
      ),
    );
  }
}
