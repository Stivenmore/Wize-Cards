import 'package:dartz/dartz.dart';
import 'package:wize_cards/core/error/exceptions.dart';
import 'package:wize_cards/core/error/failures.dart';
import 'package:wize_cards/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:wize_cards/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;

  OnboardingRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, bool>> hasCompletedOnboarding() async {
    try {
      final result = await localDataSource.hasCompletedOnboarding();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> completeOnboarding() async {
    try {
      await localDataSource.completeOnboarding();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }
}
