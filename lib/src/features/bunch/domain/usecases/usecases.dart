import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/core/usecases/usecases.dart';
import 'package:newart/src/features/bunch/data/models/bunch_model.dart';
import '../repositories/repositories.dart';

class FetchBunchUseCase extends NoParamUseCase<BunchModel> {
  final BunchRepository bunchRepository;

  FetchBunchUseCase({required this.bunchRepository});

  @override
  Future<Either<Failure, BunchModel>> call() {
    return bunchRepository.fetchBunch();
  }
}
