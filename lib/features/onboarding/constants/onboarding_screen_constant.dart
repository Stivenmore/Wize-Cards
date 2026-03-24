class OnboardingPageData {
  const OnboardingPageData({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;
}

abstract class OnboardingScreenConstant {
  static const List<OnboardingPageData> pages = [
    OnboardingPageData(
      image: 'assets/images/onboarding/onboarding_1.png',
      title: 'Discover New Decks',
      description:
          'Explore a vast library of verified flashcards tailored for professional growth.',
    ),
    OnboardingPageData(
      image: 'assets/images/onboarding/onboarding_2.png',
      title: 'Master Your Skills',
      description:
          'Personalize your learning path with smart repetition and targeted practice sessions.',
    ),
    OnboardingPageData(
      image: 'assets/images/onboarding/onboarding_3.png',
      title: 'Track Your Growth',
      description:
          'Stay motivated with detailed statistics and daily streaks to monitor your professional development.',
    ),
  ];
  static const String next = 'Next';
  static const String getStarted = 'Get Started';
  static const String skip = 'Skip';
}
