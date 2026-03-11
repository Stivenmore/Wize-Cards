import 'package:flutter/material.dart';
import 'package:wize_cards/core/presentation/widgets/icon_app_widget.dart';
import 'package:wize_cards/core/router/app_routes.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/splash/presentation/constants/splash_screen_constants.dart';

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
      body: Center(
        child: Column(
          mainAxisSize: .min,
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          spacing: SpacingConstants.small,
          children: [
            IconAppWidget(
              backgroundColor: SplashScreenConstants.splashColorIcon,
              assetPath: IconAppType.filled,
              size: IconSizeConstants.x69,
              borderRadius: BorderRadiusConstants.xLarge,
            ),
            SizedBox(height: SpacingConstants.small),
            Text(
              AppConstants.appName,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              SplashScreenConstants.brand,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
