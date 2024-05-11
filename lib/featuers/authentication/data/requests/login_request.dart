// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginPhoneRequest{
  String phone;
  String password;

  LoginPhoneRequest(this.phone, this.password);

  Map<String,dynamic> toJson()=> _$LoginPhoneRequestToJson(this);
}

@JsonSerializable()
class LoginEmailRequest{
  String email;
  String password;

  LoginEmailRequest(this.email, this.password);

  Map<String,dynamic> toJson()=> _$LoginEmailRequestToJson(this);
}
