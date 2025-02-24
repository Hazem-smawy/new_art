import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'new_order_request_model.g.dart';

@JsonSerializable()
class NewOrderRequestModel {
  bool? isUpdate;
  int? orderId;
  @JsonKey(name: "order_type_id")
  final String orderTypeId;

  @JsonKey(name: "name_order")
  final String nameOrder;

  @JsonKey(name: "artist_name")
  final String artistName;

  @JsonKey(name: "order_data")
  final String orderData;

  @JsonKey(name: "working_link")
  final String workingLink;

  @JsonKey(name: "comments")
  final String comments;

  @JsonKey(name: 'audio_clip')
  @FileConverter() // Use the custom converter here.
  final File? audioClip;

  @JsonKey(name: 'audio_attachment')
  @FileConverter() // Use the custom converter here.
  final File? audioAttachment;
  NewOrderRequestModel({
    required this.orderTypeId,
    required this.nameOrder,
    required this.artistName,
    required this.orderData,
    required this.workingLink,
    required this.comments,
    required this.audioClip,
    required this.audioAttachment,
    this.isUpdate = false,
    this.orderId = 0,
  });

  factory NewOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$NewOrderRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewOrderRequestModelToJson(this);
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
class AddOrderResponseModel {
  final String message;
  final AddOrderOrderResponseModel order;
  final String status;

  const AddOrderResponseModel({
    required this.message,
    required this.order,
    required this.status,
  });

  factory AddOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddOrderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrderResponseModelToJson(this);
}

@JsonSerializable()
class AddOrderOrderResponseModel {
  final int id;
  final String name;

  @JsonKey(name: "ref_id")
  final String refId;

  @JsonKey(name: "ord_id")
  final String ordId;

  @JsonKey(name: "created_at")
  final String createdAt;

  const AddOrderOrderResponseModel({
    required this.id,
    required this.name,
    required this.refId,
    required this.ordId,
    required this.createdAt,
  });

  factory AddOrderOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddOrderOrderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrderOrderResponseModelToJson(this);
}
