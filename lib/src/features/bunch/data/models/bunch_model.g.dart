// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bunch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BunchModel _$BunchModelFromJson(Map<String, dynamic> json) => BunchModel(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Pricing.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BunchModelToJson(BunchModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Pricing _$PricingFromJson(Map<String, dynamic> json) => Pricing(
      id: (json['id'] as num).toInt(),
      pricingTypeId: (json['pricing_type_id'] as num).toInt(),
      pricingStatusId: (json['pricing_status_id'] as num).toInt(),
      name: json['name'] as String,
      nameEn: json['name_en'] as String,
      details: json['details'] as String,
      detailsEn: json['details_en'] as String,
      currencyId: (json['currency_id'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      orderNum: (json['order_num'] as num).toInt(),
      durationDays: (json['duration_days'] as num).toInt(),
      features: json['features'] as String,
      featuresEn: json['features_en'] as String,
      other: json['other'] as String,
      otherEn: json['other_en'] as String,
      icon: json['icon'] as String,
      status: (json['status'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$PricingToJson(Pricing instance) => <String, dynamic>{
      'id': instance.id,
      'pricing_type_id': instance.pricingTypeId,
      'pricing_status_id': instance.pricingStatusId,
      'name': instance.name,
      'name_en': instance.nameEn,
      'details': instance.details,
      'details_en': instance.detailsEn,
      'currency_id': instance.currencyId,
      'price': instance.price,
      'order_num': instance.orderNum,
      'duration_days': instance.durationDays,
      'features': instance.features,
      'features_en': instance.featuresEn,
      'other': instance.other,
      'other_en': instance.otherEn,
      'icon': instance.icon,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
