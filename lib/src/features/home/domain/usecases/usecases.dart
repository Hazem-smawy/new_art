
import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/core/usecases/usecases.dart';
import 'package:newart/src/features/home/data/models/points_model.dart';

import '../../data/models/home_model.dart';
import '../repositories/repositories.dart';

class FetchHomeUseCase extends NoParamUseCase<HomeModel> {
  final HomeRepository repository;

  FetchHomeUseCase({required this.repository});

  @override
  Future<Either<Failure, HomeModel>> call() {
    return repository.fetchHomeData();
  }
}

class FetchPointsUseCase extends NoParamUseCase<PointsModel> {
  final HomeRepository repository;

  FetchPointsUseCase({required this.repository});

  @override
  Future<Either<Failure, PointsModel>> call() {
    return repository.fetchUserPoints();
  }
}
