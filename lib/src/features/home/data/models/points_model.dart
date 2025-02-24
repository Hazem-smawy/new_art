import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'points_model.g.dart';

@JsonSerializable()
class PointsModel extends Equatable {
  final String status;
  final int points;

  const PointsModel({
    required this.status,
    required this.points,
  });

  factory PointsModel.fromJson(Map<String, dynamic> json) =>
      _$PointsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PointsModelToJson(this);

  @override
  List<Object?> get props => [status, points];
}
