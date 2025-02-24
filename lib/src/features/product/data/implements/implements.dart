// ignore_for_file: public_member_api_docs, sort_constructors_first
// import '../sources/home_remote_srouce.dart';
// import '../../domain/repositories/repositories.dart';

import 'package:dartz/dartz.dart';

import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/features/product/data/models/all_products_model.dart';
import 'package:newart/src/features/product/data/sources/sources.dart';

import '../../../../core/helpers/implement_helper.dart';
import '../../domain/repositories/repositories.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductRemoteDataSource remoteSrouce;
  ProductRepositoryImp({
    required this.remoteSrouce,
  });

  @override
  Future<Either<Failure, AllProductsModel>> fetchAllProducts() async {
    return await handleApiResponse<AllProductsModel>(() async {
      return await remoteSrouce.fetchAllProduct();
    });
  }
}
