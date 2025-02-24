import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/core/usecases/usecases.dart';
import 'package:newart/src/features/wallet/data/models/all_payment_model.dart';

import '../repositories/repositories.dart';

class FetchAllPaymentUseCase extends NoParamUseCase<AllPaymentsModel> {
  final WalletRepository repository;

  FetchAllPaymentUseCase({required this.repository});

  @override
  Future<Either<Failure, AllPaymentsModel>> call() {
    return repository.fetchAllPayments();
  }
}
