// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllOrdersModel _$AllOrdersModelFromJson(Map<String, dynamic> json) =>
    AllOrdersModel(
      orders: (json['orders'] as List<dynamic>)
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$AllOrdersModelToJson(AllOrdersModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'orders': instance.orders,
    };
