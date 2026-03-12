import 'package:flutter/material.dart';
import 'package:wize_cards/core/presentation/widgets/animated_dots_widget.dart';
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

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  /// Controls the entry animation timeline (fade + slide).
  late final AnimationController _controller;

  /// Drives the opacity of the entire splash body from `0` to `1`.
  late final Animation<double> _fadeAnimation;

  /// Drives a subtle upward slide of the splash body on entry.
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _initAnimations();
    _navigateToNextScreen();
  }

  /// Sets up [_controller], [_fadeAnimation] and [_slideAnimation],
  /// then starts the animation immediately.
  void _initAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  /// Waits for the splash delay and navigates to the next screen.
  ///
  /// Currently always routes to [AppRoutes.onboarding].
  /// TODO: Verificar hasSeenOnboarding con SharedPreferences
  /// para decidir si ir a onboarding o login.
  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 10));
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, AppRoutes.search);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorConstants.primaryWhite,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.only(bottom: SpacingConstants.large),
                  child: AnimatedDotsWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
