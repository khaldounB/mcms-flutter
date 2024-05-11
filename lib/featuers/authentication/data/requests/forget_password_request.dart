// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request.g.dart';

@JsonSerializable()
class ForgetPasswordWithPhoneRequest{
  String phone;

  ForgetPasswordWithPhoneRequest(this.phone);

  Map<String,dynamic> toJson()  => _$ForgetPasswordWithPhoneRequestToJson(this);
}

@JsonSerializable()
class ForgetPasswordWithEmailRequest{
  String email;

  ForgetPasswordWithEmailRequest(this.email);

  Map<String,dynamic> toJson()  => _$ForgetPasswordWithEmailRequestToJson(this);
}
