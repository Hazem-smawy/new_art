import 'package:newart/src/core/api/http_methods.dart';
import 'package:newart/src/features/product/data/models/all_products_model.dart';

import '../../../../core/api/api.dart';

class ProductRemoteDataSource {
  HttpMethons httpMethons;
  ProductRemoteDataSource({
    required this.httpMethons,
  });

  Future<AllProductsModel> fetchAllProduct() async {
    try {
      // Define the fromJson function for OrderResponse
      var orderResponse = await httpMethons.getData<AllProductsModel>(
        AppLink.getOurBusiness,
        (json) => AllProductsModel.fromJson(
          json,
        ), // Use the fromJson method of your model
      );

      return orderResponse; // Handle the order response
    } catch (e) {
      rethrow;
    }
  }
}
