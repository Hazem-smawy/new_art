import 'package:dartz/dartz.dart';

import 'package:newart/src/core/error/failures.dart';

import 'package:newart/src/features/banks/data/models/bank_model.dart';

import '../../../../core/helpers/implement_helper.dart';
import '../sources/sources.dart';
import '../../domain/repositories/repositories.dart';

class BanksRepositoryImp implements BanksRepository {
  final BanksRemoteDataSource remoteDataSource;
  BanksRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, AllBanksModel>> fetchBanks() async {
    return await handleApiResponse<AllBanksModel>(() async {
      return await remoteDataSource.fetchBanks();
    });
  }
}
