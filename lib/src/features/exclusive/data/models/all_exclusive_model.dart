// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:newart/src/features/exclusive/data/models/exclusive_model.dart';

part 'all_exclusive_model.g.dart';

@JsonSerializable()
class AllExclusiveModel extends Equatable {
  final String status;
  final String message;
  final List<ExclusiveModel> data;
  const AllExclusiveModel({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [status, message, data];

  factory AllExclusiveModel.fromJson(Map<String, dynamic> json) =>
      _$AllExclusiveModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllExclusiveModelToJson(this);
}
