// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'check_code_request.g.dart';

@JsonSerializable()
class CheckCodeRequest{
  String code;

  CheckCodeRequest(this.code);

  Map<String,dynamic> toJson() => _$CheckCodeRequestToJson(this);
}
