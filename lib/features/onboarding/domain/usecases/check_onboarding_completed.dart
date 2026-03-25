import 'package:dartz/dartz.dart';
import 'package:wize_cards/core/error/failures.dart';
import 'package:wize_cards/core/usecases/usecase.dart';
import 'package:wize_cards/features/onboarding/domain/repositories/onboarding_repository.dart';

class CheckOnboardingCompleted extends UseCase<bool, NoParams> {
  final OnboardingRepository repository;

  CheckOnboardingCompleted(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return repository.hasCompletedOnboarding();
  }
}
