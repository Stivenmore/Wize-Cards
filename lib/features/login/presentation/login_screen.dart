import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/login/presentation/widgets/slogan_section_widget.dart';
import 'package:wize_cards/features/login/presentation/widgets/google_sign_in_widget.dart';
import 'package:wize_cards/features/login/presentation/widgets/terms_and_conditions_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(child: SloganSectionWidget()),
            Center(child: GoogleSignInButton(onPressed: () {})),
            Center(child: TermsAndConditionsWidget()),
          ],
        ),
      ),
    );
  }
}
