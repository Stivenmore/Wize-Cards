import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AnimationConstants.normal,
      width: isActive
          ? OnboardingConstants.dotActiveWidth
          : OnboardingConstants.dotSize,
      height: OnboardingConstants.dotSize,
      decoration: BoxDecoration(
        color: isActive ? ColorConstants.dotActive : ColorConstants.dotInactive,
        borderRadius: BorderRadius.circular(BorderRadiusConstants.circular),
      ),
    );
  }
}
