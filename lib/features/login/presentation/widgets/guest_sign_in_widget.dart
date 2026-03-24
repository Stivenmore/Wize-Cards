import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/login/presentation/constants/login_screen_constants.dart';

class GuestSignInButton extends StatelessWidget {
  const GuestSignInButton({
    super.key,
    required this.onPressed,
    this.horizontalPadding,
  });
  final VoidCallback onPressed;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? SpacingConstants.zero,
      ),
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: const Icon(
          Icons.person_outline,
          color: ColorConstants.blueNavy,
          size: TextSizeConstants.bodyLarge,
        ),
        label: Text(
          LoginScreenConstants.guestSignInButton,
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: ColorConstants.blueNavy),
        ),
      ),
    );
  }
}
