// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'specialization_model.g.dart';

@JsonSerializable()
class SpecializationModel{
  int id;
  String name;

  SpecializationModel(this.id, this.name);

  factory SpecializationModel.fromJson(Map<String,dynamic> json) => _$SpecializationModelFromJson(json);
}
