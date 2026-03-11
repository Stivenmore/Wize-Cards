import 'package:flutter/material.dart';
import 'package:wize_cards/core/router/app_routes.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/onboarding/constants/onboarding_screen_constant.dart';
import 'package:wize_cards/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:wize_cards/features/onboarding/presentation/widgets/onboarding_dots.dart';
import 'package:wize_cards/features/onboarding/presentation/widgets/onboarding_footer.dart';
import 'package:wize_cards/features/onboarding/presentation/widgets/onboarding_header.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const List<OnboardingPageData> _pages = OnboardingScreenConstant.pages;

  bool get _isFirstPage => _currentPage == 0;
  bool get _isLastPage => _currentPage == _pages.length - 1;
  bool get _isMiddlePage => !_isFirstPage && !_isLastPage;

  void _onNextPage() {
    _pageController.nextPage(
      duration: AnimationConstants.normal,
      curve: Curves.easeInOut,
    );
  }

  void _completeOnboarding() {
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, AppRoutes.welcome);
  }

  void _onGetStarted() => _completeOnboarding();

  void _onSkip() => _completeOnboarding();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Evita que el usuario vuelva al Splash con swipe-back
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: SpacingConstants.medium),

              // Header: Skip — siempre ocupa espacio, invisible en pagina 2
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingConstants.large,
                ),
                child: OnboardingHeader(
                  isVisible: !_isMiddlePage,
                  onSkip: _onSkip,
                ),
              ),

              // Contenido: PageView
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return OnboardingContent(page: page, isMiddle: index == 1);
                  },
                ),
              ),

              // Dots centrados (paginas 2 y 3)
              AnimatedCrossFade(
                duration: AnimationConstants.fast,
                crossFadeState: _isFirstPage
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: Padding(
                  padding: const EdgeInsets.only(
                    top: SpacingConstants.small,
                    bottom: SpacingConstants.medium,
                  ),
                  child: Center(
                    child: OnboardingDots(
                      currentPage: _currentPage,
                      pageCount: _pages.length,
                    ),
                  ),
                ),
                secondChild: const SizedBox.shrink(),
              ),

              // Footer segun la pagina
              Padding(
                padding: const EdgeInsets.only(
                  left: SpacingConstants.large,
                  right: SpacingConstants.large,
                  bottom: SpacingConstants.medium,
                ),
                child: OnboardingFooter(
                  isFirstPage: _isFirstPage,
                  isLastPage: _isLastPage,
                  currentPage: _currentPage,
                  pageCount: _pages.length,
                  onSkip: _onSkip,
                  onNext: _onNextPage,
                  onGetStarted: _onGetStarted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
