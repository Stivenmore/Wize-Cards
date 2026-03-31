import 'package:dartz/dartz.dart';
import 'package:wize_cards/core/error/failures.dart';
import 'package:wize_cards/core/usecases/usecase.dart';
import 'package:wize_cards/features/onboarding/domain/repositories/onboarding_repository.dart';

class CompleteOnboarding extends UseCase<void, NoParams> {
  final OnboardingRepository repository;

  CompleteOnboarding(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.completeOnboarding();
  }
}
