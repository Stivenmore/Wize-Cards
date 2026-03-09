import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/onboarding/presentation/widgets/dot_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const String _hasSeenOnboardingKey = 'hasSeenOnboarding';

  static const List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/onboarding/onboarding_1.png',
      'title': 'Discover New Decks',
      'description':
          'Explore a vast library of verified flashcards tailored for professional growth.',
    },
    {
      'image': 'assets/images/onboarding/onboarding_2.png',
      'title': 'Master Your Skills',
      'description':
          'Personalize your learning path with smart repetition and targeted practice sessions.',
    },
    {
      'image': 'assets/images/onboarding/onboarding_3.png',
      'title': 'Track Your Growth',
      'description':
          'Stay motivated with detailed statistics and daily streaks to monitor your professional development.',
    },
  ];

  bool get _isFirstPage => _currentPage == 0;
  bool get _isLastPage => _currentPage == _pages.length - 1;
  bool get _isMiddlePage => !_isFirstPage && !_isLastPage;

  void _onNextPage() {
    _pageController.nextPage(
      duration: AnimationConstants.normal,
      curve: Curves.easeInOut,
    );
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasSeenOnboardingKey, true);

    if (!mounted) return;

    // TODO: Reemplazar con Navigator.pushReplacement a WelcomeScreen
    // Navigator.pushReplacementNamed(context, AppRoutes.welcome);
    debugPrint('Onboarding completado — hasSeenOnboarding = true');
  }

  void _onGetStarted() => _completeOnboarding();

  void _onSkip() => _completeOnboarding();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildDots() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: SpacingConstants.small,
      children: List.generate(
        _pages.length,
        (index) => DotIndicator(isActive: _currentPage == index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedOpacity(
                    opacity: _isMiddlePage ? 0.0 : 1.0,
                    duration: AnimationConstants.fast,
                    child: IgnorePointer(
                      ignoring: _isMiddlePage,
                      child: TextButton(
                        onPressed: _onSkip,
                        child: Text('Skip', style: textTheme.labelMedium),
                      ),
                    ),
                  ),
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
                    // Pagina 2: padding 16, paginas 1 y 3: padding 24
                    final isMiddle = index == 1;
                    final horizontalPadding = isMiddle
                        ? SpacingConstants.medium
                        : SpacingConstants.large;

                    return LayoutBuilder(
                      builder: (context, constraints) {
                        final availableWidth =
                            constraints.maxWidth - (horizontalPadding * 2);

                        // Pagina 2: imagen mas grande (65% alto, full ancho)
                        // Paginas 1 y 3: imagen 55% alto, cuadrada
                        final imageHeight = isMiddle
                            ? constraints.maxHeight *
                                OnboardingConstants.expandedImageHeightRatio
                            : constraints.maxHeight *
                                OnboardingConstants.standardImageHeightRatio;
                        final imageWidth = isMiddle
                            ? availableWidth
                            : (constraints.maxHeight *
                                    OnboardingConstants
                                        .standardImageHeightRatio)
                                .clamp(0.0, availableWidth);

                        return SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: horizontalPadding,
                              ),
                              child: Column(
                                mainAxisAlignment: isMiddle
                                    ? MainAxisAlignment.start
                                    : MainAxisAlignment.center,
                                children: [
                                  if (isMiddle)
                                    const SizedBox(
                                      height: SpacingConstants.small,
                                    ),
                                  // Imagen de onboarding
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      BorderRadiusConstants.xLarge,
                                    ),
                                    child: SizedBox(
                                      width: imageWidth,
                                      height: imageHeight,
                                      child: Image.asset(
                                        _pages[index]['image']!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: SpacingConstants.large,
                                  ),
                                  Text(
                                    _pages[index]['title']!,
                                    style: textTheme.headlineLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: SpacingConstants.medium,
                                  ),
                                  Text(
                                    _pages[index]['description']!,
                                    style: textTheme.bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
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
                  child: Center(child: _buildDots()),
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
                child: _buildFooter(textTheme),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(TextTheme textTheme) {
    // Pagina 1: dots izquierda + Next derecha
    if (_isFirstPage) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDots(),
          _buildNextButton(),
        ],
      );
    }

    // Pagina 3 (ultima): Get Started full-width
    if (_isLastPage) {
      return _buildStyledButton(
        onPressed: _onGetStarted,
        isFullWidth: true,
        child: const Text('Get Started'),
      );
    }

    // Paginas intermedias: Skip izquierda + Next derecha
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: _onSkip,
          child: Text('Skip', style: textTheme.labelMedium),
        ),
        _buildNextButton(),
      ],
    );
  }

  Widget _buildNextButton() {
    return _buildStyledButton(
      onPressed: _onNextPage,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        spacing: SpacingConstants.small,
        children: [
          Text('Next'),
          Icon(Icons.arrow_forward, size: SizeConstants.iconSmall),
        ],
      ),
    );
  }

  Widget _buildStyledButton({
    required VoidCallback onPressed,
    required Widget child,
    bool isFullWidth = false,
  }) {
    return Container(
      width: isFullWidth ? double.infinity : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusConstants.circular),
        boxShadow: [
          BoxShadow(
            color: ColorConstants.primaryBlueShadow.withValues(alpha: 0.3),
            offset: const Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -4,
          ),
          BoxShadow(
            color: ColorConstants.primaryBlueShadow.withValues(alpha: 0.3),
            offset: const Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.primaryBlue,
          foregroundColor: Colors.white,
          minimumSize: isFullWidth
              ? const Size(
                  double.infinity,
                  SizeConstants.buttonHeight,
                )
              : const Size(
                  SizeConstants.buttonMinWidth,
                  SizeConstants.buttonHeight,
                ),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(BorderRadiusConstants.circular),
          ),
          elevation: 0,
        ),
        child: child,
      ),
    );
  }
}
