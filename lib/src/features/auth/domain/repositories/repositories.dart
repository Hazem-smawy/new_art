import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newart/src/core/error/error.dart';
import 'package:newart/src/features/auth/data/models/login_model.dart';
import 'package:newart/src/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  // Future<User> getUser(String userId);
  Future<Either<Failure, bool>> login(LoginModel loginModel);
  Future<Either<Failure, bool>> register(UserModel user);
  Future<Either<Failure, bool>> recoverPassword(String st);
  Stream<User?> get currentUser;
  Future<Either<Failure, bool>> isEmailVerified();
  Future<Either<Failure, void>> sendVerificationEmail();
  Future<Either<Failure, void>> reloadUser();
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, bool>> signInWithGoogle();
  Future<Either<Failure, UserModel>> getUserDetails(String id);
}
