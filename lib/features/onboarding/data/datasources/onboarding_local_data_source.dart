import 'package:shared_preferences/shared_preferences.dart';
import 'package:wize_cards/core/error/exceptions.dart';

abstract class OnboardingLocalDataSource {
  Future<bool> hasCompletedOnboarding();
  Future<void> completeOnboarding();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final SharedPreferences sharedPreferences;

  static const String _hasSeenOnboardingKey = 'has_seen_onboarding';

  OnboardingLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> hasCompletedOnboarding() async {
    try {
      return sharedPreferences.getBool(_hasSeenOnboardingKey) ?? false;
    } catch (e) {
      throw CacheException(message: 'Failed to read onboarding status.');
    }
  }

  @override
  Future<void> completeOnboarding() async {
    try {
      await sharedPreferences.setBool(_hasSeenOnboardingKey, true);
    } catch (e) {
      throw CacheException(message: 'Failed to save onboarding status.');
    }
  }
}
