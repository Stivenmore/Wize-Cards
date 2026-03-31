import 'package:dartz/dartz.dart';
import 'package:wize_cards/core/error/failures.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, bool>> hasCompletedOnboarding();
  Future<Either<Failure, void>> completeOnboarding();
}
