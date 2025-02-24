import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/features/banks/data/models/bank_model.dart';

import '../../../../core/usecases/usecases.dart';
import '../repositories/repositories.dart';

class FetchBanksUseCase extends NoParamUseCase<AllBanksModel> {
  final BanksRepository banksRepository;

  FetchBanksUseCase({required this.banksRepository});

  @override
  Future<Either<Failure, AllBanksModel>> call() {
    return banksRepository.fetchBanks();
  }
}
