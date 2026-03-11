import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';

class OnboardingPrimaryButton extends StatelessWidget {
  const OnboardingPrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isFullWidth = false,
  });

  final VoidCallback onPressed;
  final Widget child;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BorderRadiusConstants.circular),
          boxShadow: [
            BoxShadow(
              color: ColorConstants.primaryBlueShadow.withValues(alpha: 0.3),
              offset: const Offset(0, 4),
              blurRadius: 6,
              spreadRadius: -4,
            ),
            BoxShadow(
              color: ColorConstants.primaryBlueShadow.withValues(alpha: 0.3),
              offset: const Offset(0, 10),
              blurRadius: 15,
              spreadRadius: -3,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstants.primaryBlue,
            foregroundColor: Colors.white,
            minimumSize: isFullWidth
                ? const Size(double.infinity, SizeConstants.buttonHeight)
                : const Size(
                    SizeConstants.buttonMinWidth,
                    SizeConstants.buttonHeight,
                  ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                BorderRadiusConstants.circular,
              ),
            ),
            elevation: 0,
          ),
          child: child,
        ),
      ),
    );
  }
}
