import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String description;
  @JsonKey(name: 'name_en')
  final String nameEn;
  @JsonKey(name: 'slug_en')
  final String slugEn;
  @JsonKey(name: 'description_en')
  final String descriptionEn;
  @JsonKey(name: 'product_category_id')
  final int productCategoryId;
  @JsonKey(name: 'product_image')
  final String productImage;
  final int featured;
  final int status;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'audio_product')
  final String audioProduct;

  const ProductModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.nameEn,
    required this.slugEn,
    required this.descriptionEn,
    required this.productCategoryId,
    required this.productImage,
    required this.featured,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.audioProduct,
  });
  String get image => "products/$productImage";
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        description,
        nameEn,
        slugEn,
        descriptionEn,
        productCategoryId,
        productImage,
        featured,
        status,
        createdAt,
        updatedAt,
      ];
}
