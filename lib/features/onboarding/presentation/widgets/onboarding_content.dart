import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/onboarding/constants/onboarding_screen_constant.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.page,
    required this.isMiddle,
  });

  final OnboardingPageData page;
  final bool isMiddle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final horizontalPadding = isMiddle
        ? SpacingConstants.medium
        : SpacingConstants.large;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth - (horizontalPadding * 2);
        final imageHeight = isMiddle
            ? constraints.maxHeight *
                  OnboardingConstants.expandedImageHeightRatio
            : constraints.maxHeight *
                  OnboardingConstants.standardImageHeightRatio;
        final imageWidth = isMiddle
            ? availableWidth
            : (constraints.maxHeight *
                      OnboardingConstants.standardImageHeightRatio)
                  .clamp(0.0, availableWidth);

        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                mainAxisAlignment: isMiddle
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  if (isMiddle) const SizedBox(height: SpacingConstants.small),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      BorderRadiusConstants.xLarge,
                    ),
                    child: SizedBox(
                      width: imageWidth,
                      height: imageHeight,
                      child: Image.asset(page.image, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: SpacingConstants.large),
                  Text(
                    page.title,
                    style: textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: SpacingConstants.medium),
                  Text(
                    page.description,
                    style: textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
