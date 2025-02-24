import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/core/usecases/usecases.dart';
import 'package:newart/src/features/auth/domain/repositories/repositories.dart';

class SignOutUsecase extends NoParamUseCase<void> {
  AuthRepository authRepository;
  SignOutUsecase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, void>> call() async {
    return await authRepository.signOut();
  }
}
