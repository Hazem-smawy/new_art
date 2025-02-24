import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_order_model.g.dart';

@JsonSerializable()
class GetPaymentInfoModel extends Equatable {
  @JsonKey(name: 'bank_accont')
  final List<BankAccount> bankAccounts;
  final List<Currency> currencies;
  final GetPaymentOrderInfoModel order;

  const GetPaymentInfoModel({
    required this.bankAccounts,
    required this.currencies,
    required this.order,
  });

  factory GetPaymentInfoModel.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentInfoModelToJson(this);

  @override
  List<Object?> get props => [bankAccounts, currencies, order];
}

@JsonSerializable()
class GetPaymentOrderInfoModel extends Equatable {
  final int id;

  @JsonKey(name: 'ref_id')
  final String refId;
  @JsonKey(name: 'currency_id')
  final int currencyId;
  final double price;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'order_status')
  final int orderSatus;
  @JsonKey(name: 'payment_type')
  final int paymentType;
  @JsonKey(name: 'payment_data')
  final String paymentData;
  const GetPaymentOrderInfoModel({
    required this.id,
    required this.refId,
    required this.currencyId,
    required this.price,
    required this.userId,
    required this.orderSatus,
    required this.paymentType,
    required this.paymentData,
  });

  factory GetPaymentOrderInfoModel.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentOrderInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentOrderInfoModelToJson(this);

  @override
  List<Object?> get props =>
      [id, refId, userId, currencyId, price, paymentData, paymentType];
}

@JsonSerializable()
class BankAccount extends Equatable {
  final int id;
  @JsonKey(name: 'account_number')
  final String accountNumber;
  final String name;
  @JsonKey(name: 'name_en')
  final String nameEn;

  const BankAccount({
    required this.id,
    required this.accountNumber,
    required this.name,
    required this.nameEn,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountToJson(this);

  @override
  List<Object?> get props => [id, accountNumber, name, nameEn];
}

@JsonSerializable()
class Currency extends Equatable {
  final int id;
  final String code;
  final String name;
  @JsonKey(name: 'name_en')
  final String nameEn;

  const Currency({
    required this.id,
    required this.code,
    required this.name,
    required this.nameEn,
  });

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);

  @override
  List<Object?> get props => [id, code, name, nameEn];
}

@JsonSerializable()
class StorePaymentOrderResponseModel extends Equatable {
  final int id;
  final String name;
  @JsonKey(name: 'order_id')
  final int orderId;
  @JsonKey(name: 'currency_id')
  final String currencyId;
  final String amount;
  @JsonKey(name: 'created_at')
  final String createdAt;

  const StorePaymentOrderResponseModel({
    required this.id,
    required this.name,
    required this.orderId,
    required this.currencyId,
    required this.amount,
    required this.createdAt,
  });

  factory StorePaymentOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StorePaymentOrderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$StorePaymentOrderResponseModelToJson(this);

  @override
  List<Object?> get props => [id, name, orderId, currencyId, amount, createdAt];
}

@JsonSerializable()
class StorePaymentResponseModel extends Equatable {
  final String status;
  final String message;
  final StorePaymentOrderResponseModel order;

  const StorePaymentResponseModel({
    required this.status,
    required this.message,
    required this.order,
  });

  factory StorePaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StorePaymentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$StorePaymentResponseModelToJson(this);

  @override
  List<Object?> get props => [status, message, order];
}
