// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest{
  String fullname;
  String password;
  String email;
  String phone;
  @JsonKey(name: 'date_of_birth')
  String dateOfBirth;

  RegisterRequest(
      this.fullname, this.password, this.email, this.phone, this.dateOfBirth);

  Map<String,dynamic> toJson()=> _$RegisterRequestToJson(this);
}
