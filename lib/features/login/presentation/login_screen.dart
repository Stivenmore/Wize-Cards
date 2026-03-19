import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wize_cards/core/presentation/widgets/or_divider_widget.dart';
import 'package:wize_cards/core/router/app_routes.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/login/presentation/widgets/email_sign_in_widget.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: SpacingConstants.twelve,
          children: [
            Spacer(),
            SloganSectionWidget(),
            Spacer(),
            GoogleSignInButton(
              onPressed: () {
                context.go(AppRoutes.decks);
              },
              horizontalPadding: SpacingConstants.medium,
            ),
            OrDividerWidget(),
            EmailSignInButton(
              onPressed: () {},
              horizontalPadding: SpacingConstants.medium,
            ),
            TermsAndConditionsWidget(),
          ],
        ),
      ),
    );
  }
}
