import 'dart:io';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/entities.dart';

part 'new_order_mod_model.g.dart';

@JsonSerializable()
class NewOrderModModel {
  int? orderId;
  final String description;

  @JsonKey(name: 'audio_material')
  @FileConverter() // Use the custom converter here.
  final File? audioClip;

  @JsonKey(name: 'audio_attachment')
  @FileConverter() // Use the custom converter here.
  final File? audioAttachment;
  NewOrderModModel({
    required this.description,
    required this.audioClip,
    required this.audioAttachment,
    this.orderId = 0,
  });

  factory NewOrderModModel.fromJson(Map<String, dynamic> json) =>
      _$NewOrderModModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewOrderModModelToJson(this);
}

class FileConverter extends JsonConverter<File?, String?> {
  const FileConverter();

  @override
  File fromJson(String? json) {
    // Converts the string (file path) back to a File.
    return File(json ?? '');
  }

  @override
  String toJson(File? object) {
    return object?.path ?? '';
  }
}

@JsonSerializable()
class ModifiedOrderResponse {
  final String message;
  final OrderMod ordermod;
  final String status;

  ModifiedOrderResponse({
    required this.message,
    required this.ordermod,
    required this.status,
  });

  factory ModifiedOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$ModifiedOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ModifiedOrderResponseToJson(this);
}

@JsonSerializable()
class OrderMod {
  final int id;
  @JsonKey(name: 'ref_id')
  final String refId;
  final String slug;
  @JsonKey(name: 'ord_id')
  final String ordId;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'marketer_id')
  final int marketerId;
  @JsonKey(name: 'order_type_id')
  final int orderTypeId;
  @JsonKey(name: 'product_category_id')
  final int productCategoryId;
  @JsonKey(name: 'name_order')
  final String nameOrder;
  @JsonKey(name: 'artist_name')
  final String artistName;
  @JsonKey(name: 'order_data')
  final String orderData;
  @JsonKey(name: 'audio_clip')
  final String audioClip;
  @JsonKey(name: 'audio_attachment')
  final String audioAttachment;
  @JsonKey(name: 'working_link')
  final String workingLink;
  final String comments;
  @JsonKey(name: 'date_order')
  final String dateOrder;
  @JsonKey(name: 'payment_type')
  final int paymentType;
  @JsonKey(name: 'sheila_name')
  final String sheilaName;
  @JsonKey(name: 'additions_to_order')
  final String additionsToOrder;
  @JsonKey(name: 'implementation_period')
  final String implementationPeriod;
  @JsonKey(name: 'currency_id')
  final int currencyId;
  final int price;
  @JsonKey(name: 'cabin_id')
  final int cabinId;
  @JsonKey(name: 'artist_id')
  final int artistId;
  @JsonKey(name: 'date_update_waite')
  final String dateUpdateWaite;
  @JsonKey(name: 'payment_data')
  final String paymentData;
  @JsonKey(name: 'review_data')
  final String reviewData;
  @JsonKey(name: 'date_update_pross')
  final String dateUpdatePross;
  @JsonKey(name: 'audio_material')
  final String audioMaterial;
  final String notes;
  @JsonKey(name: 'notes_on_work')
  final String notesOnWork;
  @JsonKey(name: 'date_completed')
  final String dateCompleted;
  @JsonKey(name: 'notes_re_process')
  final String notesReProcess;
  @JsonKey(name: 'date_re_process')
  final String dateReProcess;
  @JsonKey(name: 'order_status')
  final int orderStatus;
  final int exclusive;
  @JsonKey(name: 'order_payment')
  final int orderPayment;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  OrderMod({
    required this.id,
    required this.refId,
    required this.slug,
    required this.ordId,
    required this.userId,
    required this.marketerId,
    required this.orderTypeId,
    required this.productCategoryId,
    required this.nameOrder,
    required this.artistName,
    required this.orderData,
    required this.audioClip,
    required this.audioAttachment,
    required this.workingLink,
    required this.comments,
    required this.dateOrder,
    required this.paymentType,
    required this.sheilaName,
    required this.additionsToOrder,
    required this.implementationPeriod,
    required this.currencyId,
    required this.price,
    required this.cabinId,
    required this.artistId,
    required this.dateUpdateWaite,
    required this.paymentData,
    required this.reviewData,
    required this.dateUpdatePross,
    required this.audioMaterial,
    required this.notes,
    required this.notesOnWork,
    required this.dateCompleted,
    required this.notesReProcess,
    required this.dateReProcess,
    required this.orderStatus,
    required this.exclusive,
    required this.orderPayment,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderMod.fromJson(Map<String, dynamic> json) =>
      _$OrderModFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModToJson(this);

  List<OrderStatus> get getOrderStatus => [
        OrderStatus(
          id: 0,
          name: 'طلب تعديل جديد', // New Order
          date: dateOrder,
          isCompleted: orderStatus >= 0,
          color: Colors.blue,
          icon: Icons.music_note, // Represents a new audio request
          statusId: 0,
        ),
        OrderStatus(
          id: 1,
          name: "قيد الإنتظار", // Waiting
          date: dateUpdateWaite,
          isCompleted: orderStatus >= 1,
          color: Colors.orange,
          icon: Icons.hourglass_empty, // Indicates waiting
          statusId: 1,
        ),
        OrderStatus(
          id: 2,
          name: "قيد المعالجة", // Processing
          date: dateUpdatePross,
          isCompleted: orderStatus >= 2,
          color: Colors.green,
          icon: Icons
              .graphic_eq, // Represents processing (e.g., equalizing or effects processing)
          statusId: 2,
        ),
        OrderStatus(
          id: 3,
          name: "قيد التنفيذ", // Executing
          date: dateCompleted,
          isCompleted: orderStatus >= 3,
          color: Colors.purple,
          icon: Icons.settings_voice, // Indicates active processing or mixing
          statusId: 3,
        ),
        OrderStatus(
          id: 4,
          name: "اكتمال", // Completed
          date: dateCompleted,
          isCompleted: orderStatus >= 4,
          color: Colors.teal,
          icon:
              Icons.library_music, // Represents a completed song or audio track
          statusId: 4,
        ),
      ];
}
