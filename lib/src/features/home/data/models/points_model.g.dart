// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointsModel _$PointsModelFromJson(Map<String, dynamic> json) => PointsModel(
      status: json['status'] as String,
      points: (json['points'] as num).toInt(),
    );

Map<String, dynamic> _$PointsModelToJson(PointsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'points': instance.points,
    };
