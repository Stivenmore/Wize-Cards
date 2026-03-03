import 'package:flutter/material.dart';
import 'package:wize_cards/features/login/presentation/widgets/slogan_section_widget.dart';
import 'package:wize_cards/features/login/presentation/widgets/terms_and_conditions_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 16,
          children: [
            Center(child: SloganSectionWidget()),
            Center(child: TermsAndConditionsWidget()),
          ]
        ),
      ),
    );
  }
}
