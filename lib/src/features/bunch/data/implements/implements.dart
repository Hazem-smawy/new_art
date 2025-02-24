import 'package:dartz/dartz.dart';

import 'package:newart/src/core/error/failures.dart';

import 'package:newart/src/features/bunch/data/models/bunch_model.dart';

import '../../../../core/helpers/implement_helper.dart';
import '../sources/sources.dart';
import '../../domain/repositories/repositories.dart';

class BunchRepositoryImp implements BunchRepository {
  final BunchRemoteDataSource remoteDataSource;
  BunchRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, BunchModel>> fetchBunch() async {
    return await handleApiResponse<BunchModel>(() async {
      return await remoteDataSource.fetachAllBunch();
    });
  }
}
