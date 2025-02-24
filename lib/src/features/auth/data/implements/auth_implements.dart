import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:newart/src/core/error/failures.dart';

import 'package:newart/src/features/auth/data/models/login_model.dart';

import 'package:newart/src/features/auth/data/models/user_model.dart';
import 'package:newart/src/features/auth/data/sources/firebse_data_source.dart';

import '../sources/sources.dart';
import '../../domain/repositories/repositories.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteSource remoteDataSource;
  final FirebseDataSource firebseDataSource;
  AuthRepositoryImp({
    required this.remoteDataSource,
    required this.firebseDataSource,
  });

  @override
  Future<Either<Failure, bool>> login(LoginModel loginModel) async {
    try {
      await firebseDataSource.login(loginModel);
      return Right(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return Left(FirebaseFailures(message: 'Invalid email or password.'));
      } else if (e.code == 'user-not-found') {
        return Left(
            FirebaseFailures(message: 'No user found with this email.'));
      } else if (e.code == 'wrong-password') {
        return Left(FirebaseFailures(message: 'Incorrect password.'));
      } else if (e.code == 'too-many-requests') {
        return Left(FirebaseFailures(
            message: 'Too many attempts. Please try again later.'));
      } else {
        // Handle other Firebase errors
        return Left(ServerFailure(message: 'Login failed: ${e.message}'));
      }
    } catch (e) {
      // Handle generic errors
      return Left(ServerFailure(message: 'An unexpected error occurred.'));
    }
  }

  @override
  Future<Either<Failure, bool>> recoverPassword(String email) async {
    //firebase
    try {
      await firebseDataSource.recoverPassword(email);
      return Right(true);
    } catch (e) {
      return Left(FirebaseFailures(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> register(UserModel user) async {
    try {
      // Step 1: Create User with Email and Password
      await firebseDataSource.register(user);
      return Right(true);
    } catch (e) {
      return Left(FirebaseFailures(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserDetails(String userId) async {
    try {
      final userDetails = await firebseDataSource.getUserDetails(userId);
      return Right(userDetails);
    } catch (e) {
      return Left(OfflineFailure(message: 'no user $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> isEmailVerified() async {
    try {
      User? user = firebseDataSource.firebaseAuth.currentUser;
      await user?.reload(); // Ensure user state is refreshed
      var isVerified = user?.emailVerified;
      return Right(isVerified ?? false);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailures(message: "Firebase error: ${e.message}"));
    } catch (e) {
      return Left(ServerFailure(message: "Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Stream<User?> get currentUser => firebseDataSource.currentUser;

  @override
  Future<Either<Failure, void>> sendVerificationEmail() async {
    try {
      await firebseDataSource.sendVerificationEmail();
      return Right(null);
    } catch (e) {
      return Left(
          FirebaseFailures(message: "Failed to send verification email: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> reloadUser() async {
    try {
      await firebseDataSource.reloadUser();
      return const Right(null);
    } catch (e) {
      return Left(FirebaseFailures(message: "Failed to reload user: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await firebseDataSource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(FirebaseFailures(message: "Failed to sign out: $e"));
    }
  }

  @override
  Future<Either<Failure, bool>> signInWithGoogle() async {
    try {
      await firebseDataSource.signInWithGoogle();

      return Right(true);
    } catch (e) {
      return Left(
          GoogleAuthFailures(message: 'Google sign-in error: ${e.toString()}'));
    }
  }
}
