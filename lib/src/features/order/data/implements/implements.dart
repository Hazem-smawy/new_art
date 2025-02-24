import 'package:dartz/dartz.dart';

import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/features/order/data/models/all_orders_model.dart';

import 'package:newart/src/features/order/data/models/new_order_request_model.dart';


import 'package:newart/src/features/order/data/models/order_types_model.dart';
import 'package:newart/src/features/order/data/models/payment_order_model.dart';
import 'package:newart/src/features/order/data/models/transfer_model.dart';

import '../../../../core/error/error.dart';
import '../../../../core/helpers/implement_helper.dart';
import '../sources/sources.dart';
import '../../domain/repositories/repositories.dart';

class OrderRepositoryImp implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;
  OrderRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, OrderTypesResponse>> fetchAllOrderTypes() async {
    return await handleApiResponse<OrderTypesResponse>(() async {
      return await remoteDataSource.fetchAllOrderTypes();
    });
  }

  @override
  Future<Either<Failure, AllOrdersModel>> fetchAllOrders() async {
    return await handleApiResponse<AllOrdersModel>(() async {
      return await remoteDataSource.fetchAllOldOrder();
    });
  }

  @override
  Future<Either<Failure, AddOrderResponseModel>> addNewOrder(
      NewOrderRequestModel order) async {
    return await handleApiResponse<AddOrderResponseModel>(() async {
      return await remoteDataSource.addNewOrder(order);
    });
  }

  @override
  Future<Either<Failure, GetPaymentInfoModel>> getOrderPaymentDetails(
      int id) async {
    return await handleApiResponse<GetPaymentInfoModel>(() async {
      return await remoteDataSource.getOrderPaymentDetails(id);
    });
  }

  @override
  Future<Either<Failure, GetPaymentOrderInfoModel>> newTransfer(
      TransferModel trans) async {
    return await handleApiResponse<GetPaymentOrderInfoModel>(() async {
      return await remoteDataSource.addNewPayment(trans);
    });
  }
}
