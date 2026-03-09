import 'package:flutter/material.dart';
import 'package:wize_cards/core/router/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  /// Espera 2 segundos y navega al onboarding.
  /// TODO: Verificar hasSeenOnboarding con SharedPreferences
  /// para decidir si ir a onboarding o login.
  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        spacing: 24,
        children: [
          Center(
            child: Text(
              'Splash Screen',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).highlightColor,
            ),
          ),
        ],
      ),
    );
  }
}
