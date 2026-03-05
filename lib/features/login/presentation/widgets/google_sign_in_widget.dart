import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wize_cards/features/login/presentation/constants/login_screen_constants.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(padding: EdgeInsets.only(left: 4)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset("assets/images/icons/google-icon.svg"),
            ),
          ),
          Text(
            LoginScreenConstants.googleSignInButton,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
