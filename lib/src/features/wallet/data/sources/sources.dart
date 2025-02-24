import 'package:newart/src/core/api/http_methods.dart';
import 'package:newart/src/features/wallet/data/models/all_payment_model.dart';

import '../../../../core/api/api.dart';

class WalletRemoteDataSource {
  HttpMethons httpMethons;
  WalletRemoteDataSource({
    required this.httpMethons,
  });

  Future<AllPaymentsModel> fetchAllPayments() async {
    try {
      // Define the fromJson function for OrderResponse
      var orderResponse = await httpMethons.getData<AllPaymentsModel>(
        AppLink.getPayments,
        (json) => AllPaymentsModel.fromJson(
          json,
        ), // Use the fromJson method of your model
      );

      return orderResponse; // Handle the order response
    } catch (e) {
      rethrow;
    }
  }
}
