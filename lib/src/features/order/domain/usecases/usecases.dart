import 'package:dartz/dartz.dart';
import 'package:newart/src/core/usecases/usecases.dart';
import 'package:newart/src/features/order/data/models/all_orders_model.dart';
import 'package:newart/src/features/order/data/models/new_order_mod_model.dart';
import 'package:newart/src/features/order/data/models/new_order_request_model.dart';
import 'package:newart/src/features/order/data/models/order_types_model.dart';
import 'package:newart/src/features/order/data/models/payment_order_model.dart';
import 'package:newart/src/features/order/data/models/transfer_model.dart';
import 'package:newart/src/features/order/domain/repositories/repositories.dart';

import '../../../../core/error/error.dart';

// class CreateOrderUseCase extends ParamsUseCase<OrderResponse, OrderResponse> {
//   final OrderRepository orderRepository;

//   CreateOrderUseCase({required this.orderRepository});

//   @override
//   Future<Either<Failure, OrderResponse>> call(OrderModel order) {
//     return orderRepository.createOrder(order);
//   }
// }

class AddNewOrderUseCase
    extends ParamsUseCase<AddOrderResponseModel, Params<NewOrderRequestModel>> {
  final OrderRepository orderRepository;

  AddNewOrderUseCase({required this.orderRepository});

  @override
  Future<Either<Failure, AddOrderResponseModel>> call(Params params) {
    return orderRepository.addNewOrder(params.data);
  }
}

class AddNewOrderModUseCase
    extends ParamsUseCase<ModifiedOrderResponse, Params<NewOrderModModel>> {
  final OrderRepository orderRepository;

  AddNewOrderModUseCase({required this.orderRepository});

  @override
  Future<Either<Failure, ModifiedOrderResponse>> call(Params params) {
    return orderRepository.addNewModOrder(params.data);
  }
}

class FetchAllOrderUseCase extends NoParamUseCase<AllOrdersModel> {
  final OrderRepository orderRepository;

  FetchAllOrderUseCase({required this.orderRepository});

  @override
  Future<Either<Failure, AllOrdersModel>> call() {
    return orderRepository.fetchAllOrders();
  }
}

class GetOrderPaymentDetailsUseCase
    extends ParamsUseCase<GetPaymentInfoModel, Params<int>> {
  final OrderRepository orderRepository;

  GetOrderPaymentDetailsUseCase({required this.orderRepository});

  @override
  Future<Either<Failure, GetPaymentInfoModel>> call(Params params) {
    return orderRepository.getOrderPaymentDetails(params.data);
  }
}

class PostTranserUserCase
    extends ParamsUseCase<GetPaymentOrderInfoModel, Params<TransferModel>> {
  final OrderRepository orderRepository;

  PostTranserUserCase({required this.orderRepository});

  @override
  Future<Either<Failure, GetPaymentOrderInfoModel>> call(Params params) {
    return orderRepository.newTransfer(params.data);
  }
}

class FetchAllOrderTypesUseCase extends NoParamUseCase<OrderTypesResponse> {
  final OrderRepository orderRepository;

  FetchAllOrderTypesUseCase({required this.orderRepository});

  @override
  Future<Either<Failure, OrderTypesResponse>> call() {
    return orderRepository.fetchAllOrderTypes();
  }
}

// class DeleteOrderUseCase extends ParamsUseCase<void, Params<String>> {
//   final OrderRepository orderRepository;

//   DeleteOrderUseCase({required this.orderRepository});

//   @override
//   Future<Either<Failure, int>> call(Params<String> params) {
//     return orderRepository.deleteOrder(params.data);
//   }
// }
