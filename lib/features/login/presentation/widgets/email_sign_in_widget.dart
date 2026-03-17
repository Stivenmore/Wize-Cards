import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/login/presentation/constants/login_screen_constants.dart';

class EmailSignInButton extends StatelessWidget {
  const EmailSignInButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(
        Icons.email_outlined, 
        color: ColorConstants.blueNavy,
        size: TextSizeConstants.bodyLarge,
      ),
      label: Text(
        LoginScreenConstants.emailSignInButton,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: ColorConstants.blueNavy
        )
      ),
    );
  }
}