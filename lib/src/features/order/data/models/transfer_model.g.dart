// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferModel _$TransferModelFromJson(Map<String, dynamic> json) =>
    TransferModel(
      orderId: (json['order_id'] as num).toInt(),
      currencyId: (json['currency_id'] as num).toInt(),
      bankAccountId: (json['bank_account_id'] as num).toInt(),
      transferNumber: json['transfer_number'] as String,
      senderName: json['sender_name'] as String,
      senderPhone: json['sender_phone'] as String,
      recipientName: json['recipient_name'] as String,
      recipientPhone: json['recipient_phone'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: json['date'] as String,
      otherData: json['other_data'] as String,
      transferImage:
          const ImageConverter().fromJson(json['transfer_image'] as String),
    );

Map<String, dynamic> _$TransferModelToJson(TransferModel instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'currency_id': instance.currencyId,
      'transfer_image': const ImageConverter().toJson(instance.transferImage),
      'bank_account_id': instance.bankAccountId,
      'transfer_number': instance.transferNumber,
      'sender_name': instance.senderName,
      'sender_phone': instance.senderPhone,
      'recipient_name': instance.recipientName,
      'recipient_phone': instance.recipientPhone,
      'amount': instance.amount,
      'date': instance.date,
      'other_data': instance.otherData,
    };
