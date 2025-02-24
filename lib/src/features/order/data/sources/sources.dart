import 'package:newart/src/core/api/api.dart';
import 'package:newart/src/core/api/http_methods.dart';
import 'package:newart/src/features/order/data/models/all_orders_model.dart';
import 'package:newart/src/features/order/data/models/new_order_request_model.dart';
import 'package:newart/src/features/order/data/models/order_types_model.dart';
import 'package:newart/src/features/order/data/models/payment_order_model.dart';
import 'package:newart/src/features/order/data/models/transfer_model.dart';

class OrderRemoteDataSource {
  HttpMethons httpMethons;

  OrderRemoteDataSource({required this.httpMethons});

  Future<OrderTypesResponse> fetchAllOrderTypes() async {
    try {
      // Define the fromJson function for OrderResponse
      var orderResponse = await httpMethons.getData<OrderTypesResponse>(
        AppLink.getOrderTypes,
        (json) => OrderTypesResponse.fromJson(
          json,
        ), // Use the fromJson method of your model
      );

      return orderResponse; // Handle the order response
    } catch (e) {
      rethrow;
      // Handle exceptions (Offline, Server, etc.)
    }
  }

  Future<AllOrdersModel> fetchAllOldOrder() async {
    try {
      // Define the fromJson function for OrderResponse
      var orderResponse = await httpMethons.getData<AllOrdersModel>(
        AppLink.getOrderIndex,
        (json) => AllOrdersModel.fromJson(
          json,
        ), // Use the fromJson method of your model
      );

      return orderResponse; // Handle the order response
    } catch (e) {
      rethrow;
      // Handle exceptions (Offline, Server, etc.)
    }
  }

  Future<AddOrderResponseModel> addNewOrder(
      NewOrderRequestModel newOrder) async {
    try {
      // Define the fromJson function for OrderResponse
      var orderResponse = await httpMethons.postOrderFile(
          newOrder.isUpdate ?? false
              ? '${AppLink.updateOrder}${newOrder.orderId}'
              : AppLink.storeorder,
          newOrder);
      final orderModel = AddOrderResponseModel.fromJson(orderResponse);
      return orderModel; // Handle the order response
    } catch (e) {
      rethrow;
      // Handle exceptions (Offline, Server, etc.)
    }
  }

  Future<GetPaymentOrderInfoModel> addNewPayment(TransferModel transfer) async {
    try {
      // Define the fromJson function for OrderResponse
      var response = await httpMethons.postPaymentTransferImg(
          '${AppLink.postPaymentTransfer}${transfer.orderId}', transfer);
      final orderModel = GetPaymentOrderInfoModel.fromJson(response);

      return orderModel; // Handle the order response
    } catch (e) {
      rethrow;
      // Handle exceptions (Offline, Server, etc.)
    }
  }

  Future<GetPaymentInfoModel> getOrderPaymentDetails(int id) async {
    try {
      // Define the fromJson function for OrderResponse
      var response = await httpMethons.getData<GetPaymentInfoModel>(
        '${AppLink.createOrderPayment}$id',
        (json) => GetPaymentInfoModel.fromJson(
          json,
        ),
      );
      return response; // Handle the order response
    } catch (e) {
      rethrow;
      // Handle exceptions (Offline, Server, etc.)
    }
  }
}
