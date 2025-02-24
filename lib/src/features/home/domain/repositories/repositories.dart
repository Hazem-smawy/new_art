import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/features/home/data/models/home_model.dart';
import 'package:newart/src/features/home/data/models/points_model.dart';

abstract class HomeRepository {
  // Future<User> getUser(String userId);
  Future<Either<Failure, HomeModel>> fetchHomeData();
  Future<Either<Failure, PointsModel>> fetchUserPoints();
}
