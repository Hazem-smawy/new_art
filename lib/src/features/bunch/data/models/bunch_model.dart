import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bunch_model.g.dart';

@JsonSerializable()
class BunchModel extends Equatable {
  final String status;
  final String message;
  final List<Pricing> data;

  const BunchModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BunchModel.fromJson(Map<String, dynamic> json) =>
      _$BunchModelFromJson(json);

  Map<String, dynamic> toJson() => _$BunchModelToJson(this);

  @override
  List<Object?> get props => [status, message, data];
}

@JsonSerializable()
class Pricing extends Equatable {
  final int id;
  @JsonKey(name: 'pricing_type_id')
  final int pricingTypeId;
  @JsonKey(name: 'pricing_status_id')
  final int pricingStatusId;
  final String name;
  @JsonKey(name: 'name_en')
  final String nameEn;
  final String details;
  @JsonKey(name: 'details_en')
  final String detailsEn;
  @JsonKey(name: 'currency_id')
  final int currencyId;
  final int price;
  @JsonKey(name: 'order_num')
  final int orderNum;
  @JsonKey(name: 'duration_days')
  final int durationDays;
  final String features;
  @JsonKey(name: 'features_en')
  final String featuresEn;
  final String other;
  @JsonKey(name: 'other_en')
  final String otherEn;
  final String icon;
  final int status;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  const Pricing({
    required this.id,
    required this.pricingTypeId,
    required this.pricingStatusId,
    required this.name,
    required this.nameEn,
    required this.details,
    required this.detailsEn,
    required this.currencyId,
    required this.price,
    required this.orderNum,
    required this.durationDays,
    required this.features,
    required this.featuresEn,
    required this.other,
    required this.otherEn,
    required this.icon,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pricing.fromJson(Map<String, dynamic> json) =>
      _$PricingFromJson(json);

  Map<String, dynamic> toJson() => _$PricingToJson(this);

  @override
  List<Object?> get props => [
        id,
        pricingTypeId,
        pricingStatusId,
        name,
        nameEn,
        details,
        detailsEn,
        currencyId,
        price,
        orderNum,
        durationDays,
        features,
        featuresEn,
        other,
        otherEn,
        icon,
        status,
        createdAt,
        updatedAt,
      ];
}
