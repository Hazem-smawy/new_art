import 'package:dartz/dartz.dart';

import 'package:newart/src/core/error/failures.dart';

import 'package:newart/src/features/wallet/data/models/all_payment_model.dart';

import '../../../../core/helpers/implement_helper.dart';
import '../sources/sources.dart';
import '../../domain/repositories/repositories.dart';

class WalletRepositoryImp implements WalletRepository {
  final WalletRemoteDataSource remoteDataSource;
  WalletRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, AllPaymentsModel>> fetchAllPayments() async {
    return await handleApiResponse<AllPaymentsModel>(() async {
      return await remoteDataSource.fetchAllPayments();
    });
  }

  // ... example ...
  //
  // Future<User> getUser(String userId) async {
  //     return remoteDataSource.getUser(userId);
  //   }
  // ...
}
    // ignore_for_file: public_member_api_docs, sort_constructors_first
// import '../sources/home_remote_srouce.dart';
// import '../../domain/repositories/repositories.dart';


