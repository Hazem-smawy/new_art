import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:math';

part 'exclusive_model.g.dart';

final Random _random = Random();

@JsonSerializable()
class ExclusiveModel extends Equatable {
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

  const ExclusiveModel({
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

  factory ExclusiveModel.fromJson(Map<String, dynamic> json) =>
      _$ExclusiveModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExclusiveModelToJson(this);

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
      ];

  String get image {
    final List<String> images = [
      'https://i.pinimg.com/736x/1e/6d/0a/1e6d0a95510b4e3d662aa777674697d1.jpg',
      'https://i.pinimg.com/736x/d6/be/64/d6be6469430482dff19b45250bcd109c.jpg',
      'https://i.pinimg.com/736x/88/c3/e5/88c3e500e2eec9b0751331b45fa56afd.jpg',
      'https://i.pinimg.com/736x/6d/16/21/6d1621e454ae008986afe53e4e6a8894.jpg',
      'https://i.pinimg.com/736x/29/9c/73/299c73b1c25dc16dff94c80b0eef8ec3.jpg',
      'https://i.pinimg.com/736x/8d/33/4b/8d334b940b01b9d74fb32d37be144700.jpg',
    ];

    return images[_random.nextInt(images.length)];
  }
}
