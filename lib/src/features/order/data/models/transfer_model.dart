import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'transfer_model.g.dart';

@JsonSerializable()
class TransferModel {
  @JsonKey(name: 'order_id')
  final int orderId;
  @JsonKey(name: 'currency_id')
  final int currencyId;
  @ImageConverter()
  @JsonKey(name: 'transfer_image')
  File transferImage;
  @JsonKey(name: 'bank_account_id')
  final int bankAccountId;

  @JsonKey(name: 'transfer_number')
  final String transferNumber;

  @JsonKey(name: 'sender_name')
  final String senderName;

  @JsonKey(name: 'sender_phone')
  final String senderPhone;

  @JsonKey(name: 'recipient_name')
  final String recipientName;

  @JsonKey(name: 'recipient_phone')
  final String recipientPhone;

  final double amount;

  // If you want to use a DateTime, you can change the type and use a custom converter.
  final String date;

  @JsonKey(name: 'other_data')
  final String otherData;

  TransferModel({
    required this.orderId,
    required this.currencyId,
    required this.bankAccountId,
    required this.transferNumber,
    required this.senderName,
    required this.senderPhone,
    required this.recipientName,
    required this.recipientPhone,
    required this.amount,
    required this.date,
    required this.otherData,
    required this.transferImage,
  });

  factory TransferModel.fromJson(Map<String, dynamic> json) =>
      _$TransferModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransferModelToJson(this);
}

class ImageConverter extends JsonConverter<File, String> {
  const ImageConverter();

  @override
  File fromJson(String json) {
    // Converts the string (file path) back to a File.
    return File(json);
  }

  @override
  String toJson(File object) {
    return object.path;
  }
}
