import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/login/presentation/constants/login_screen_constants.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(padding: EdgeInsets.only(left: 4)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryIconTheme.color,
                borderRadius: BorderRadius.circular(BorderRadiusConstants.medium),
              ),
              padding: const EdgeInsets.all(SpacingConstants.twelve),
              child: SvgPicture.asset(AppConstants.googleLogo),
            ),
          ),
          Text(
            LoginScreenConstants.googleSignInButton,
            style: TextStyle(fontSize: TextSizeConstants.bodyLarge),
          ),
        ],
      ),
    );
  }
}
