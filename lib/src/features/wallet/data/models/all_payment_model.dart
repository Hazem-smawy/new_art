import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_payment_model.g.dart';

@JsonSerializable()
class AllPaymentsModel extends Equatable {
  final String status;
  final List<Payment> payment;

  const AllPaymentsModel({
    required this.status,
    required this.payment,
  });

  factory AllPaymentsModel.fromJson(Map<String, dynamic> json) =>
      _$AllPaymentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllPaymentsModelToJson(this);

  @override
  List<Object?> get props => [status, payment];
}

@JsonSerializable()
// ignore: must_be_immutable
class Payment extends Equatable {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'order_id')
  int? orderId;
  @JsonKey(name: 'currency_id')
  final int currencyId;
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
  final int amount;
  final String date;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  Payment({
    required this.id,
    required this.userId,
    this.orderId = 0,
    required this.currencyId,
    required this.bankAccountId,
    required this.transferNumber,
    required this.senderName,
    required this.senderPhone,
    required this.recipientName,
    required this.recipientPhone,
    required this.amount,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);

  @override
  List<Object?> get props => [
        id,
        userId,
        orderId,
        currencyId,
        bankAccountId,
        transferNumber,
        senderName,
        senderPhone,
        recipientName,
        recipientPhone,
        amount,
        date,
        createdAt,
        updatedAt,
      ];
}
