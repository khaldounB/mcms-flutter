// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'specialization_model.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel{
  int id;
  String name;
  String email;
  String phone;
  List<SpecializationModel> specializations;

  DoctorModel(this.id, this.name, this.email, this.phone, this.specializations);

  factory DoctorModel.fromJson(Map<String,dynamic> json) => _$DoctorModelFromJson(json);
}
