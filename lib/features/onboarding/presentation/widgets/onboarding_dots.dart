import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/onboarding/presentation/widgets/dot_indicator.dart';

class OnboardingDots extends StatelessWidget {
  const OnboardingDots({
    super.key,
    required this.currentPage,
    required this.pageCount,
  });

  final int currentPage;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: SpacingConstants.small,
      children: List.generate(
        pageCount,
        (index) => DotIndicator(isActive: currentPage == index),
      ),
    );
  }
}
