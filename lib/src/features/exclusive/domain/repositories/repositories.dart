import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/features/exclusive/data/models/all_exclusive_model.dart';

abstract class ExclusiveRepository {
  // Future<User> getUser(String userId);
  Future<Either<Failure, AllExclusiveModel>> fetchAllExclusive();
}
