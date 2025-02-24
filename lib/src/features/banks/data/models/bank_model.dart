import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_model.g.dart';

@JsonSerializable()
class AllBanksModel extends Equatable {
  final String status;
  final String message;
  final List<Bank> data;

  const AllBanksModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllBanksModel.fromJson(Map<String, dynamic> json) =>
      _$AllBanksModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllBanksModelToJson(this);

  @override
  List<Object?> get props => [status, message, data];
}

@JsonSerializable()
class Bank extends Equatable {
  final int id;
  @JsonKey(name: 'account_number')
  final String accountNumber;
  @JsonKey(name: 'account_name')
  final String accountName;
  @JsonKey(name: 'account_name_en')
  final String accountNameEn;
  @JsonKey(name: 'account_code')
  final String accountCode;
  @JsonKey(name: 'account_id')
  final String accountId;
  final String name;
  @JsonKey(name: 'name_en')
  final String nameEn;
  @JsonKey(name: 'account_type')
  final String accountType;
  @JsonKey(name: 'account_balance')
  final String accountBalance;
  final String branch;
  final String iban;
  final int status;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  const Bank({
    required this.id,
    required this.accountNumber,
    required this.accountName,
    required this.accountNameEn,
    required this.accountCode,
    required this.accountId,
    required this.name,
    required this.nameEn,
    required this.accountType,
    required this.accountBalance,
    required this.branch,
    required this.iban,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);

  Map<String, dynamic> toJson() => _$BankToJson(this);

  @override
  List<Object?> get props => [
        id,
        accountNumber,
        accountName,
        accountNameEn,
        accountCode,
        accountId,
        name,
        nameEn,
        accountType,
        accountBalance,
        branch,
        iban,
        status,
        createdAt,
        updatedAt,
      ];
}
