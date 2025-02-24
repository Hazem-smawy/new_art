import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/error.dart';
import 'package:newart/src/features/wallet/data/models/all_payment_model.dart';

abstract class WalletRepository {
  // Future<User> getUser(String userId);
  Future<Either<Failure, AllPaymentsModel>> fetchAllPayments();
}
