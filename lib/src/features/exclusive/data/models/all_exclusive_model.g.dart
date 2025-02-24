// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_exclusive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllExclusiveModel _$AllExclusiveModelFromJson(Map<String, dynamic> json) =>
    AllExclusiveModel(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ExclusiveModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllExclusiveModelToJson(AllExclusiveModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
