// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String fullname;
  String phone;
  String email;
  @JsonKey(name: 'date_of_birth')
  String dataOfBirth;
  @JsonKey(name: 'is_admin')
  bool isAdmin;

  UserModel(this.id, this.fullname, this.phone, this.email, this.dataOfBirth,
      this.isAdmin);

  factory UserModel.fromJson(Map<String,dynamic> json) => _$UserModelFromJson(json);
}
