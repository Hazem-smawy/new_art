import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_types_model.g.dart';

@JsonSerializable()
class OrderTypesResponse extends Equatable {
  @JsonKey(name: 'order_types')
  final List<OrderType> orderTypes;
  final String status;

  const OrderTypesResponse({
    required this.orderTypes,
    required this.status,
  });

  factory OrderTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderTypesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderTypesResponseToJson(this);

  @override
  List<Object?> get props => [orderTypes, status];
}

@JsonSerializable()
class OrderType extends Equatable {
  final int id;
  final String name;
  @JsonKey(name: "name_en")
  final String nameEn;

  const OrderType({
    required this.id,
    required this.name,
    required this.nameEn,
  });

  factory OrderType.fromJson(Map<String, dynamic> json) =>
      _$OrderTypeFromJson(json);

  Map<String, dynamic> toJson() => _$OrderTypeToJson(this);

  @override
  List<Object?> get props => [id, name, nameEn];
}
