// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T, E> {
  String? message;
  int? code;
  T? data;
  bool success;

  BaseResponse() : success = true;

  BaseResponse.completed(this.data,this.code,this.message) : success = true;

  BaseResponse.error({this.message,this.code}) : success = false;

  factory BaseResponse.fromJson(
      json,
      Function(Map<String, dynamic>) fromJsonT,
      Function(Map<String, dynamic>) fromJsonE,
      ) {
    try {


      if (json is Map<String, dynamic> && json['code'] != null) {
        if (json['code'] != 200 || (json['message'] != null && json['data'] == null)) {

          return BaseResponse.error(message: json['message'] ?? "Unknown error",code: json['code']);
        }

        return BaseResponse.completed(fromJsonT(json),json['code'],json['message']);
      }

      throw Exception("Invalid JSON format");
    } catch (error) {

      return BaseResponse.error(message: "Something went wrong");
    }
  }

  void logMessage() {

  }
}
