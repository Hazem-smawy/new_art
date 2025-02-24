// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/core/usecases/usecases.dart';
import 'package:newart/src/features/auth/domain/repositories/repositories.dart';

class RecoverPasswordUsecase extends ParamsUseCase<bool, Params<String>> {
  AuthRepository authRepository;
  RecoverPasswordUsecase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, bool>> call(Params params) {
    return authRepository.recoverPassword(params.data);
  }
}
