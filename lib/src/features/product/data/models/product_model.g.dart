// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      nameEn: json['name_en'] as String,
      slugEn: json['slug_en'] as String,
      descriptionEn: json['description_en'] as String,
      productCategoryId: (json['product_category_id'] as num).toInt(),
      productImage: json['product_image'] as String,
      featured: (json['featured'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      audioProduct: json['audio_product'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'name_en': instance.nameEn,
      'slug_en': instance.slugEn,
      'description_en': instance.descriptionEn,
      'product_category_id': instance.productCategoryId,
      'product_image': instance.productImage,
      'featured': instance.featured,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'audio_product': instance.audioProduct,
    };
