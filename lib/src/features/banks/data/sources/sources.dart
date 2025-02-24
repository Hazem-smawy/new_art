// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:newart/src/core/api/http_methods.dart';
import 'package:newart/src/features/banks/data/models/bank_model.dart';

import '../../../../core/api/api.dart';

class BanksRemoteDataSource {
  HttpMethons httpMethons;
  BanksRemoteDataSource({
    required this.httpMethons,
  });

  Future<AllBanksModel> fetchBanks() async {
    try {
      // Define the fromJson function for OrderResponse
      var orderResponse = await httpMethons.getData<AllBanksModel>(
        AppLink.getOurBank,
        (json) => AllBanksModel.fromJson(
          json,
        ), // Use the fromJson method of your model
      );

      return orderResponse; // Handle the order response
    } catch (e) {
      rethrow;
    }
  }
}
