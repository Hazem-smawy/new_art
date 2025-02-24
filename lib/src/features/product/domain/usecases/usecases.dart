import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/core/usecases/usecases.dart';
import 'package:newart/src/features/product/data/models/all_products_model.dart';

import '../repositories/repositories.dart';

class FetchAllProcutUseCase extends NoParamUseCase<AllProductsModel> {
  final ProductRepository repository;

  FetchAllProcutUseCase({required this.repository});

  @override
  Future<Either<Failure, AllProductsModel>> call() {
    return repository.fetchAllProducts();
  }
}
