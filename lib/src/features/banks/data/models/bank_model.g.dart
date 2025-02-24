// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllBanksModel _$AllBanksModelFromJson(Map<String, dynamic> json) =>
    AllBanksModel(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Bank.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllBanksModelToJson(AllBanksModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Bank _$BankFromJson(Map<String, dynamic> json) => Bank(
      id: (json['id'] as num).toInt(),
      accountNumber: json['account_number'] as String,
      accountName: json['account_name'] as String,
      accountNameEn: json['account_name_en'] as String,
      accountCode: json['account_code'] as String,
      accountId: json['account_id'] as String,
      name: json['name'] as String,
      nameEn: json['name_en'] as String,
      accountType: json['account_type'] as String,
      accountBalance: json['account_balance'] as String,
      branch: json['branch'] as String,
      iban: json['iban'] as String,
      status: (json['status'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'id': instance.id,
      'account_number': instance.accountNumber,
      'account_name': instance.accountName,
      'account_name_en': instance.accountNameEn,
      'account_code': instance.accountCode,
      'account_id': instance.accountId,
      'name': instance.name,
      'name_en': instance.nameEn,
      'account_type': instance.accountType,
      'account_balance': instance.accountBalance,
      'branch': instance.branch,
      'iban': instance.iban,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
