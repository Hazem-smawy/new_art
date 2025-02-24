// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/features/auth/domain/repositories/repositories.dart';


class VerifyEmailUseCase {
  final AuthRepository authRepository;

  VerifyEmailUseCase(this.authRepository);

  Future<Either<Failure, void>> sendVerificationEmail() async {
    return await authRepository.sendVerificationEmail();
  }

  Future<Either<Failure, bool>> checkEmailVerified() async {
    return await authRepository.isEmailVerified();
  }

  Future<Either<Failure, void>> signOut() async {
    return await authRepository.signOut();
  }
}
