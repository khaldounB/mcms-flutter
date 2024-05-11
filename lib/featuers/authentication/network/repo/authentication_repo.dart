// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../../core/constants/server/end_points.dart';
import '../../../../core/logic/interceptor/interceptor.dart';
import '../../../../core/utils/base_model/base_model.dart';
import '../../data/models/auth_model.dart';
import '../../data/requests/change_password_request.dart';
import '../../data/requests/check_code_request.dart';
import '../../data/requests/forget_password_request.dart';
import '../../data/requests/login_request.dart';
import '../../data/requests/register_request.dart';
import '../services/authentication_services.dart';

class AuthenticationRepo {
  static final AuthenticationRepo _instance = AuthenticationRepo._internal();
  static final _dio = Dio()..interceptors.add(ApplicationInterceptor());

  factory AuthenticationRepo() {
    return _instance;
  }

  AuthenticationRepo._internal();

  static final AuthenticationServices _AuthenticationServices =
      AuthenticationServices(_dio, baseUrl: EndPoints.host);

  Future<T> retry<T>(
    Future<T> Function() apiCall, {
    int maxRetries = 3,
    Duration delay = const Duration(seconds: 0),
  }) async {
    int retryCount = 0;

    Future<T> tryApiCall() async {
      try {
        return await apiCall();
      } catch (error) {
        debugPrint('Error Handling: $error');

        if (retryCount < maxRetries) {
          await Future.delayed(delay);
          retryCount++;
          return tryApiCall();
        } else {
          rethrow;
        }
      }
    }

    return tryApiCall();
  }

  Future<BaseResponse<AuthModel, dynamic>> loginWithPhone(
      LoginPhoneRequest request) async {
    return await retry(
        () async => await _AuthenticationServices.loginWithPhone(request));
  }

  Future<BaseResponse<AuthModel, dynamic>> loginWithEmail(
      LoginEmailRequest request) async {
    return await retry(
        () async => await _AuthenticationServices.loginWithEmail(request));
  }

  Future<BaseResponse<AuthModel, dynamic>> register(
      RegisterRequest request) async {
    return await retry(
        () async => await _AuthenticationServices.register(request));
  }

  Future<BaseResponse> forgetPasswordWithEmail(
      ForgetPasswordWithEmailRequest request) async {
    return await retry(() async =>
        await _AuthenticationServices.forgetPasswordWithEmail(request));
  }

  Future<BaseResponse> forgetPasswordWithPhone(
      ForgetPasswordWithPhoneRequest request) async {
    return await retry(() async =>
        await _AuthenticationServices.forgetPasswordWithPhone(request));
  }

  Future<BaseResponse<AuthModel, dynamic>> checkCode(
      CheckCodeRequest request) async {
    return await retry(
        () async => await _AuthenticationServices.checkCode(request));
  }

  Future<BaseResponse<AuthModel, dynamic>> changePassword(
      ChangePasswordRequest request) async {
    return await retry(
        () async => await _AuthenticationServices.changePassword(request));
  }
}
