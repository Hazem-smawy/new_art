import 'package:newart/src/features/exclusive/data/models/all_exclusive_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/helpers/implement_helper.dart';
import '../../domain/repositories/repositories.dart';

import '../sources/sources.dart';

class ExclusiveRepositoryImp implements ExclusiveRepository {
  final ExclusiveRemoteDataSource remoteDataSource;
  ExclusiveRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, AllExclusiveModel>> fetchAllExclusive() async {
    return await handleApiResponse<AllExclusiveModel>(() async {
      return await remoteDataSource.fetchAllExlusive();
    });
  }
  // ...
}
