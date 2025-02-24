import 'package:dartz/dartz.dart';
import 'package:newart/src/features/banks/data/models/bank_model.dart';

import '../../../../core/error/failures.dart';

abstract class BanksRepository {
  Future<Either<Failure, AllBanksModel>> fetchBanks();
}
