// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewOrderRequestModel _$NewOrderRequestModelFromJson(
        Map<String, dynamic> json) =>
    NewOrderRequestModel(
      orderTypeId: json['order_type_id'] as String,
      nameOrder: json['name_order'] as String,
      artistName: json['artist_name'] as String,
      orderData: json['order_data'] as String,
      workingLink: json['working_link'] as String,
      comments: json['comments'] as String,
      audioClip: const FileConverter().fromJson(json['audio_clip'] as String?),
      audioAttachment:
          const FileConverter().fromJson(json['audio_attachment'] as String?),
      isUpdate: json['isUpdate'] as bool? ?? false,
      orderId: (json['orderId'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$NewOrderRequestModelToJson(
        NewOrderRequestModel instance) =>
    <String, dynamic>{
      'isUpdate': instance.isUpdate,
      'orderId': instance.orderId,
      'order_type_id': instance.orderTypeId,
      'name_order': instance.nameOrder,
      'artist_name': instance.artistName,
      'order_data': instance.orderData,
      'working_link': instance.workingLink,
      'comments': instance.comments,
      'audio_clip': const FileConverter().toJson(instance.audioClip),
      'audio_attachment':
          const FileConverter().toJson(instance.audioAttachment),
    };

AddOrderResponseModel _$AddOrderResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddOrderResponseModel(
      message: json['message'] as String,
      order: AddOrderOrderResponseModel.fromJson(
          json['order'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$AddOrderResponseModelToJson(
        AddOrderResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'order': instance.order,
      'status': instance.status,
    };

AddOrderOrderResponseModel _$AddOrderOrderResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddOrderOrderResponseModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      refId: json['ref_id'] as String,
      ordId: json['ord_id'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$AddOrderOrderResponseModelToJson(
        AddOrderOrderResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ref_id': instance.refId,
      'ord_id': instance.ordId,
      'created_at': instance.createdAt,
    };
