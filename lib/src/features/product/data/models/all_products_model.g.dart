// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllProductsModel _$AllProductsModelFromJson(Map<String, dynamic> json) =>
    AllProductsModel(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllProductsModelToJson(AllProductsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
