// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllPaymentsModel _$AllPaymentsModelFromJson(Map<String, dynamic> json) =>
    AllPaymentsModel(
      status: json['status'] as String,
      payment: (json['payment'] as List<dynamic>)
          .map((e) => Payment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllPaymentsModelToJson(AllPaymentsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payment': instance.payment,
    };

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      orderId: (json['order_id'] as num?)?.toInt() ?? 0,
      currencyId: (json['currency_id'] as num).toInt(),
      bankAccountId: (json['bank_account_id'] as num).toInt(),
      transferNumber: json['transfer_number'] as String,
      senderName: json['sender_name'] as String,
      senderPhone: json['sender_phone'] as String,
      recipientName: json['recipient_name'] as String,
      recipientPhone: json['recipient_phone'] as String,
      amount: (json['amount'] as num).toInt(),
      date: json['date'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'order_id': instance.orderId,
      'currency_id': instance.currencyId,
      'bank_account_id': instance.bankAccountId,
      'transfer_number': instance.transferNumber,
      'sender_name': instance.senderName,
      'sender_phone': instance.senderPhone,
      'recipient_name': instance.recipientName,
      'recipient_phone': instance.recipientPhone,
      'amount': instance.amount,
      'date': instance.date,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
