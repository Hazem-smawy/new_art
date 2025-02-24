// ignore_for_file: public_member_api_docs, sort_constructors_first
// import '../sources/home_remote_srouce.dart';
// import '../../domain/repositories/repositories.dart';

import 'package:dartz/dartz.dart';

import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/features/home/data/models/home_model.dart';
import 'package:newart/src/features/home/data/models/points_model.dart';
import 'package:newart/src/features/home/data/sources/home_remote_srouce.dart';

import '../../../../core/helpers/implement_helper.dart';
import '../../domain/repositories/repositories.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeRemoteSrouce remoteSrouce;
  HomeRepositoryImp({
    required this.remoteSrouce,
  });

  @override
  Future<Either<Failure, HomeModel>> fetchHomeData() async {
    return await handleApiResponse<HomeModel>(remoteSrouce.fetchHomeData);
  }

  @override
  Future<Either<Failure, PointsModel>> fetchUserPoints() async {
    return await handleApiResponse<PointsModel>(remoteSrouce.fetchPoints);
  }
}
