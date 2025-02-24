// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import 'package:newart/src/features/auth/domain/repositories/repositories.dart';

class CurrentUserUsecase {
  AuthRepository authRepository;
  CurrentUserUsecase({
    required this.authRepository,
  });

  Stream<User?> call() {
    return authRepository.currentUser;
  }
}
