// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:newart/src/features/product/data/models/product_model.dart';

part 'all_products_model.g.dart';

@JsonSerializable()
class AllProductsModel extends Equatable {
  final String status;
  final String message;
  final List<ProductModel> data;
  const AllProductsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [status, message, data];

  factory AllProductsModel.fromJson(Map<String, dynamic> json) =>
      _$AllProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllProductsModelToJson(this);
}
