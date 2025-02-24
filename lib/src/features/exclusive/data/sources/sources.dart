import 'package:newart/src/core/api/http_methods.dart';
import 'package:newart/src/features/exclusive/data/models/all_exclusive_model.dart';

import '../../../../core/api/api.dart';

class ExclusiveRemoteDataSource {
  HttpMethons httpMethons;
  ExclusiveRemoteDataSource({
    required this.httpMethons,
  });

  Future<AllExclusiveModel> fetchAllExlusive() async {
    try {
      // Define the fromJson function for OrderResponse
      var orderResponse = await httpMethons.getData<AllExclusiveModel>(
        AppLink.getExclusive,
        (json) => AllExclusiveModel.fromJson(
          json,
        ), // Use the fromJson method of your model
      );

      return orderResponse; // Handle the order response
    } catch (e) {
      rethrow;
    }
  }
}
