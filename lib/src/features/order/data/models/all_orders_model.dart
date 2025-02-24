import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:newart/src/features/order/data/models/order_model.dart';

part 'all_orders_model.g.dart';

@JsonSerializable()
class AllOrdersModel extends Equatable {
  final String status;
  final List<OrderModel> orders;
  const AllOrdersModel({
    required this.orders,
    required this.status,
  });

  factory AllOrdersModel.fromJson(Map<String, dynamic> json) =>
      _$AllOrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllOrdersModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [status, orders];
}
