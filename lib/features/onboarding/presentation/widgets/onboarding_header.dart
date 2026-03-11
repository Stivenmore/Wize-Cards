import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/onboarding/constants/onboarding_screen_constant.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({
    super.key,
    required this.isVisible,
    required this.onSkip,
  });

  final bool isVisible;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingConstants.large),
      child: Align(
        alignment: Alignment.centerRight,
        child: AnimatedOpacity(
          opacity: isVisible ? 1.0 : 0.0,
          duration: AnimationConstants.fast,
          child: IgnorePointer(
            ignoring: !isVisible,
            child: TextButton(
              onPressed: onSkip,
              child: Text(OnboardingScreenConstant.skip, style: textTheme.labelMedium),
            ),
          ),
        ),
      ),
    );
  }
}
