import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/features/bunch/data/models/bunch_model.dart';

abstract class BunchRepository {
  // Future<User> getUser(String userId);
  Future<Either<Failure, BunchModel>> fetchBunch();
}
