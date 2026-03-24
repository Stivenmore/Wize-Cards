import 'package:dartz/dartz.dart';
import 'package:wize_cards/core/error/failures.dart';
import 'package:wize_cards/core/usecases/usecase.dart';
import 'package:wize_cards/features/auth/domain/entities/user.dart';
import 'package:wize_cards/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUser implements UseCase<User, NoParams> {
  final AuthRepository repository;

  GetCurrentUser(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.getCurrentUser();
  }
}
