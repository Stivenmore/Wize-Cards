import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/onboarding/constants/onboarding_screen_constant.dart';
import 'package:wize_cards/features/onboarding/presentation/widgets/onboarding_dots.dart';
import 'package:wize_cards/features/onboarding/presentation/widgets/onboarding_primary_button.dart';

class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({
    super.key,
    required this.isFirstPage,
    required this.isLastPage,
    required this.currentPage,
    required this.pageCount,
    required this.onSkip,
    required this.onNext,
    required this.onGetStarted,
  });

  final bool isFirstPage;
  final bool isLastPage;
  final int currentPage;
  final int pageCount;
  final VoidCallback onSkip;
  final VoidCallback onNext;
  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (isFirstPage) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OnboardingDots(currentPage: currentPage, pageCount: pageCount),
          _NextButton(onPressed: onNext),
        ],
      );
    }

    if (isLastPage) {
      return OnboardingPrimaryButton(
        onPressed: onGetStarted,
        isFullWidth: true,
        child: Text(OnboardingScreenConstant.getStarted),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onSkip,
          child: Text(
            OnboardingScreenConstant.skip,
            style: textTheme.labelMedium,
          ),
        ),
        _NextButton(onPressed: onNext),
      ],
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OnboardingPrimaryButton(
      onPressed: onPressed,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        spacing: SpacingConstants.small,
        children: [
          Text(OnboardingScreenConstant.next),
          Icon(Icons.arrow_forward, size: IconSizeConstants.x18),
        ],
      ),
    );
  }
}
