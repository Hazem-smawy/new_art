// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:new_art/src/core/error/failures.dart';
import 'package:new_art/src/core/usecases/usecases.dart';
import 'package:new_art/src/features/auth/data/models/login_model.dart';
import 'package:new_art/src/features/auth/domain/repositories/repositories.dart';

class LoginUsecase extends ParamsUseCase<bool, Params<LoginModel>> {
  AuthRepository authRepository;
  LoginUsecase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await authRepository.login(params.data);
  }
}
