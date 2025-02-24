import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/core/usecases/usecases.dart';
import 'package:newart/src/features/exclusive/data/models/all_exclusive_model.dart';

import '../repositories/repositories.dart';

class FetchAllExclusiveUseCase extends NoParamUseCase<AllExclusiveModel> {
  final ExclusiveRepository repository;

  FetchAllExclusiveUseCase({required this.repository});

  @override
  Future<Either<Failure, AllExclusiveModel>> call() {
    return repository.fetchAllExclusive();
  }
}
