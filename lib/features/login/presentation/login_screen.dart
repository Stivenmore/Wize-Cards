import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wize_cards/core/presentation/widgets/or_divider_widget.dart';
import 'package:wize_cards/core/router/app_routes.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wize_cards/features/auth/presentation/bloc/auth_event.dart';
import 'package:wize_cards/features/auth/presentation/bloc/auth_state.dart';
import 'package:wize_cards/features/login/presentation/widgets/guest_sign_in_widget.dart';
import 'package:wize_cards/features/login/presentation/widgets/slogan_section_widget.dart';
import 'package:wize_cards/features/login/presentation/widgets/google_sign_in_widget.dart';
import 'package:wize_cards/features/login/presentation/widgets/terms_and_conditions_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              context.go(AppRoutes.decks);
            } else if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoading;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: SpacingConstants.twelve,
              children: [
                Spacer(),
                SloganSectionWidget(),
                Spacer(),
                if (isLoading)
                  const CircularProgressIndicator()
                else
                  GoogleSignInButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthGoogleSignInRequested());
                    },
                    horizontalPadding: SpacingConstants.medium,
                  ),
                OrDividerWidget(),
                GuestSignInButton(
                  onPressed: isLoading
                      ? () {}
                      : () {
                          context.read<AuthBloc>().add(
                            AuthAnonymousSignInRequested(),
                          );
                        },
                  horizontalPadding: SpacingConstants.medium,
                ),
                TermsAndConditionsWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
