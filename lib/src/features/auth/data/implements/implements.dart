import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/constants/share_pref_keys.dart';

import 'package:new_art/src/core/error/failures.dart';
import 'package:new_art/src/core/helpers/handling_reponse.dart';
import 'package:new_art/src/core/services/shared_preferences.dart';

import 'package:new_art/src/features/auth/data/models/login_model.dart';

import 'package:new_art/src/features/auth/data/models/user_model.dart';

import '../sources/sources.dart';
import '../../domain/repositories/repositories.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteSource remoteDataSource;
  AuthRepositoryImp({required this.remoteDataSource});

  MyServices services = Get.find();

  @override
  Future<Either<Failure, bool>> login(LoginModel loginModel) async {
    try {
      final response = await remoteDataSource.login(loginModel);
      services.sharedPreferences.setString(
        SharedPrefKeys.TOKEN_KEY,
        response['token'],
      );
      return Right(true);
    } catch (e) {
      return Left(ServerFailures(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> recoverPassword(String st) {
    // TODO: implement recoverPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> register(UserModel user) async {
    try {
      final response = await remoteDataSource.register(user);
      services.sharedPreferences.setString(
        SharedPrefKeys.TOKEN_KEY,
        response['token'],
      );
      return Right(true);
    } catch (e) {
      return Left(ServerFailures(message: e.toString()));
    }
  }
}
