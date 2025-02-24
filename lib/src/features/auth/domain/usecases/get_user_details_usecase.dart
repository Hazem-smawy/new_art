// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/core/usecases/usecases.dart';
import 'package:newart/src/features/auth/data/models/user_model.dart';
import 'package:newart/src/features/auth/domain/repositories/repositories.dart';

class GetUserDetailsUsecase extends ParamsUseCase<UserModel, Params<String>> {
  AuthRepository authRepository;
  GetUserDetailsUsecase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, UserModel>> call(Params params) async {
    return await authRepository.getUserDetails(params.data);
  }
}
