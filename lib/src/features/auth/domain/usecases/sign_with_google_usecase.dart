import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/core/usecases/usecases.dart';
import 'package:newart/src/features/auth/domain/repositories/repositories.dart';

class SignWithGoogleUsecase extends NoParamUseCase<bool> {
  AuthRepository authRepository;
  SignWithGoogleUsecase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, bool>> call() async {
    return await authRepository.signInWithGoogle();
  }
}
