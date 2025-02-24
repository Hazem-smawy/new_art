// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderTypesResponse _$OrderTypesResponseFromJson(Map<String, dynamic> json) =>
    OrderTypesResponse(
      orderTypes: (json['order_types'] as List<dynamic>)
          .map((e) => OrderType.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$OrderTypesResponseToJson(OrderTypesResponse instance) =>
    <String, dynamic>{
      'order_types': instance.orderTypes,
      'status': instance.status,
    };

OrderType _$OrderTypeFromJson(Map<String, dynamic> json) => OrderType(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      nameEn: json['name_en'] as String,
    );

Map<String, dynamic> _$OrderTypeToJson(OrderType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_en': instance.nameEn,
    };
