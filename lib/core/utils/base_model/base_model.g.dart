// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T, E> _$BaseResponseFromJson<T, E>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
  E Function(Object? json) fromJsonE,
) =>
    BaseResponse<T, E>()
      ..message = json['message'] as String?
      ..code = (json['code'] as num?)?.toInt()
      ..data = _$nullableGenericFromJson(json['data'], fromJsonT)
      ..success = json['success'] as bool;

Map<String, dynamic> _$BaseResponseToJson<T, E>(
  BaseResponse<T, E> instance,
  Object? Function(T value) toJsonT,
  Object? Function(E value) toJsonE,
) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'success': instance.success,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
