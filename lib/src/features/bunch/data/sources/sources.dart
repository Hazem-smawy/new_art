// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:newart/src/features/bunch/data/models/bunch_model.dart';

import '../../../../core/api/api.dart';
import '../../../../core/api/http_methods.dart';

class BunchRemoteDataSource {
  HttpMethons httpMethons;
  BunchRemoteDataSource({
    required this.httpMethons,
  });

  Future<BunchModel> fetachAllBunch() async {
    try {
      // Define the fromJson function for OrderResponse
      var orderResponse = await httpMethons.getData<BunchModel>(
        AppLink.getPackages,
        (json) => BunchModel.fromJson(
          json,
        ), // Use the fromJson method of your model
      );

      return orderResponse; // Handle the order response
    } catch (e) {
      rethrow;
    }
  }
}
