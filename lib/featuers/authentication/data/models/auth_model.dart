// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'user_model.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel{
  @JsonKey(name: 'access_token')
  String accessToken;
  UserModel user;

  AuthModel(this.accessToken, this.user);

  factory AuthModel.fromJson(Map<String,dynamic> json) => _$AuthModelFromJson(json);
}
