import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/features/order/data/models/all_orders_model.dart';
import 'package:newart/src/features/order/data/models/new_order_mod_model.dart';
import 'package:newart/src/features/order/data/models/new_order_request_model.dart';
import 'package:newart/src/features/order/data/models/order_types_model.dart';
import 'package:newart/src/features/order/data/models/payment_order_model.dart';
import 'package:newart/src/features/order/data/models/transfer_model.dart';

abstract class OrderRepository {
  // Future<Either<Failure, OrderResponse>> createOrder(OrderModel order);
  Future<Either<Failure, AllOrdersModel>> fetchAllOrders();
  Future<Either<Failure, OrderTypesResponse>> fetchAllOrderTypes();
  Future<Either<Failure, AddOrderResponseModel>> addNewOrder(
      NewOrderRequestModel order);
  Future<Either<Failure, ModifiedOrderResponse>> addNewModOrder(
      NewOrderModModel modOrder);
  Future<Either<Failure, GetPaymentInfoModel>> getOrderPaymentDetails(int id);
  Future<Either<Failure, GetPaymentOrderInfoModel>> newTransfer(
      TransferModel trans);
}
