// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest{
  String code;

  ChangePasswordRequest(this.code);

  Map<String,dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
