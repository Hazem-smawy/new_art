import 'package:dartz/dartz.dart';
import 'package:new_art/src/core/error/error.dart';
import 'package:new_art/src/features/auth/data/models/login_model.dart';
import 'package:new_art/src/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  // Future<User> getUser(String userId);
  Future<Either<Failure, bool>> login(LoginModel loginModel);
  Future<Either<Failure, bool>> register(UserModel user);
  Future<Either<Failure, bool>> recoverPassword(String st);
}
