import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/features/product/data/models/all_products_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, AllProductsModel>> fetchAllProducts();
}
