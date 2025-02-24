// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPaymentInfoModel _$GetPaymentInfoModelFromJson(Map<String, dynamic> json) =>
    GetPaymentInfoModel(
      bankAccounts: (json['bank_accont'] as List<dynamic>)
          .map((e) => BankAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      currencies: (json['currencies'] as List<dynamic>)
          .map((e) => Currency.fromJson(e as Map<String, dynamic>))
          .toList(),
      order: GetPaymentOrderInfoModel.fromJson(
          json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPaymentInfoModelToJson(
        GetPaymentInfoModel instance) =>
    <String, dynamic>{
      'bank_accont': instance.bankAccounts,
      'currencies': instance.currencies,
      'order': instance.order,
    };

GetPaymentOrderInfoModel _$GetPaymentOrderInfoModelFromJson(
        Map<String, dynamic> json) =>
    GetPaymentOrderInfoModel(
      id: (json['id'] as num).toInt(),
      refId: json['ref_id'] as String,
      currencyId: (json['currency_id'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      userId: (json['user_id'] as num).toInt(),
      orderSatus: (json['order_status'] as num).toInt(),
      paymentType: (json['payment_type'] as num).toInt(),
      paymentData: json['payment_data'] as String,
    );

Map<String, dynamic> _$GetPaymentOrderInfoModelToJson(
        GetPaymentOrderInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ref_id': instance.refId,
      'currency_id': instance.currencyId,
      'price': instance.price,
      'user_id': instance.userId,
      'order_status': instance.orderSatus,
      'payment_type': instance.paymentType,
      'payment_data': instance.paymentData,
    };

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) => BankAccount(
      id: (json['id'] as num).toInt(),
      accountNumber: json['account_number'] as String,
      name: json['name'] as String,
      nameEn: json['name_en'] as String,
    );

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_number': instance.accountNumber,
      'name': instance.name,
      'name_en': instance.nameEn,
    };

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      nameEn: json['name_en'] as String,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'name_en': instance.nameEn,
    };

StorePaymentOrderResponseModel _$StorePaymentOrderResponseModelFromJson(
        Map<String, dynamic> json) =>
    StorePaymentOrderResponseModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      orderId: (json['order_id'] as num).toInt(),
      currencyId: json['currency_id'] as String,
      amount: json['amount'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$StorePaymentOrderResponseModelToJson(
        StorePaymentOrderResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order_id': instance.orderId,
      'currency_id': instance.currencyId,
      'amount': instance.amount,
      'created_at': instance.createdAt,
    };

StorePaymentResponseModel _$StorePaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    StorePaymentResponseModel(
      status: json['status'] as String,
      message: json['message'] as String,
      order: StorePaymentOrderResponseModel.fromJson(
          json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StorePaymentResponseModelToJson(
        StorePaymentResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'order': instance.order,
    };
