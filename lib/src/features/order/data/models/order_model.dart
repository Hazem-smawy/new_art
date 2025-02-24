import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/entities.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends Equatable with CustomDropdownListFilter {
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
  @JsonKey(name: 'product_category_id', defaultValue: 0)
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
  @JsonKey(name: 'payment_type', defaultValue: 0)
  final int paymentType;
  @JsonKey(name: 'sheila_name', defaultValue: '')
  final String sheilaName;
  @JsonKey(name: 'additions_to_order', defaultValue: '')
  final String additionsToOrder;
  @JsonKey(name: 'implementation_period', defaultValue: '0000-00-00')
  final String implementationPeriod;
  @JsonKey(name: 'currency_id', defaultValue: 0)
  final int currencyId;
  final double price;
  @JsonKey(name: 'cabin_id', defaultValue: 0)
  final int cabinId;
  @JsonKey(name: 'artist_id', defaultValue: 0)
  final int artistId;
  @JsonKey(name: 'date_update_waite', defaultValue: '0000-00-00')
  final String dateUpdateWaite;
  @JsonKey(name: 'payment_data', defaultValue: '')
  final String paymentData;
  @JsonKey(name: 'review_data', defaultValue: '')
  final String reviewData;
  @JsonKey(name: 'date_update_pross', defaultValue: '0000-00-00')
  final String dateUpdatePross;
  @JsonKey(name: 'audio_material', defaultValue: '')
  final String audioMaterial;
  @JsonKey(name: 'notes', defaultValue: '')
  final String notes;
  @JsonKey(name: 'notes_on_work', defaultValue: '')
  final String notesOnWork;
  @JsonKey(name: 'date_completed', defaultValue: '0000-00-00')
  final String dateCompleted;
  @JsonKey(name: 'notes_re_process', defaultValue: '')
  final String notesReProcess;
  @JsonKey(name: 'date_re_process', defaultValue: '0000-00-00')
  final String dateReProcess;
  @JsonKey(name: 'order_status', defaultValue: 0)
  final int orderStatus;
  final int exclusive;
  @JsonKey(name: 'order_payment', defaultValue: 0)
  final int orderPayment;
  @JsonKey(name: 'implementation_date', defaultValue: '0000-00-00')
  final String implementationDate;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  const OrderModel(
      {required this.id,
      required this.refId,
      required this.slug,
      required this.ordId,
      required this.userId,
      required this.marketerId,
      required this.orderTypeId,
      this.productCategoryId = 0,
      required this.nameOrder,
      required this.artistName,
      required this.orderData,
      required this.audioClip,
      required this.audioAttachment,
      required this.workingLink,
      required this.comments,
      required this.dateOrder,
      this.paymentType = 0,
      this.sheilaName = '',
      this.additionsToOrder = '',
      this.implementationPeriod = '0000-00-00',
      this.currencyId = 0,
      required this.price,
      this.cabinId = 0,
      this.artistId = 0,
      this.dateUpdateWaite = '0000-00-00',
      this.paymentData = '',
      this.reviewData = '',
      this.dateUpdatePross = '0000-00-00',
      this.audioMaterial = '',
      this.notes = '',
      this.notesOnWork = '',
      this.dateCompleted = '0000-00-00',
      this.notesReProcess = '',
      this.dateReProcess = '0000-00-00',
      this.orderStatus = 0,
      required this.exclusive,
      this.orderPayment = 0,
      required this.createdAt,
      required this.updatedAt,
      this.implementationDate = '0000-00-00'});

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        refId,
        slug,
        ordId,
        userId,
        marketerId,
        orderTypeId,
        productCategoryId,
        nameOrder,
        artistName,
        orderData,
        audioClip,
        audioAttachment,
        workingLink,
        comments,
        dateOrder,
        paymentType,
        sheilaName,
        additionsToOrder,
        implementationPeriod,
        currencyId,
        price,
        cabinId,
        artistId,
        dateUpdateWaite,
        paymentData,
        reviewData,
        dateUpdatePross,
        audioMaterial,
        notes,
        notesOnWork,
        dateCompleted,
        notesReProcess,
        dateReProcess,
        orderStatus,
        exclusive,
        orderPayment,
        createdAt,
        updatedAt,
        implementationDate,
      ];

  @override
  String toString() {
    return nameOrder;
  }

  // List<OrderStatus> get getOrderStatus => [
  //       OrderStatus(
  //         id: 0,
  //         name: 'طلب جديد',
  //         date: dateOrder,
  //         isCompleted: orderStatus >= 0,
  //         color: Colors.blue,
  //         icon: Icons.shopping_cart,
  //         statusId: 0,
  //       ),
  //       OrderStatus(
  //         id: 1,
  //         name: "قيد الإنتضار",
  //         date: dateUpdateWaite,
  //         isCompleted: orderStatus >= 1,
  //         color: Colors.orange,
  //         icon: Icons.sync,
  //         statusId: 1,
  //       ),
  //       OrderStatus(
  //         id: 2,
  //         name: "قيد المعالجة",
  //         date: dateUpdatePross,
  //         isCompleted: orderStatus >= 2,
  //         color: Colors.green,
  //         icon: Icons.local_shipping,
  //         statusId: 2,
  //       ),
  //       OrderStatus(
  //         id: 3,
  //         name: "قيد التنفيذ",
  //         date: implementationDate,
  //         isCompleted: orderStatus >= 3,
  //         color: Colors.purple,
  //         icon: Icons.delivery_dining,
  //         statusId: 3,
  //       ),
  //       OrderStatus(
  //         id: 4,
  //         name: "اكتمال",
  //         date: dateCompleted,
  //         isCompleted: orderStatus >= 4,
  //         color: Colors.teal,
  //         icon: Icons.home,
  //         statusId: 4,
  //       ),
  //     ];
  List<OrderStatus> get getOrderStatus => [
        OrderStatus(
          id: 0,
          name: 'طلب جديد', // New Order
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
          date: implementationDate,
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

  @override
  bool filter(String query) {
    return nameOrder.toLowerCase().contains(query.toLowerCase());
  }
}
