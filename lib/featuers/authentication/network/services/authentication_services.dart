// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

// Project imports:
import '../../../../core/constants/server/end_points.dart';
import '../../../../core/utils/base_model/base_model.dart';
import '../../data/models/auth_model.dart';
import '../../data/requests/change_password_request.dart';
import '../../data/requests/check_code_request.dart';
import '../../data/requests/forget_password_request.dart';
import '../../data/requests/login_request.dart';
import '../../data/requests/register_request.dart';

part 'authentication_services.g.dart';

@RestApi(baseUrl: EndPoints.host)
abstract class AuthenticationServices {
  factory AuthenticationServices(Dio dio, {String baseUrl}) =
      _AuthenticationServices;

  @POST(EndPoints.login)
  Future<BaseResponse<AuthModel, dynamic>> loginWithPhone(
      @Body() LoginPhoneRequest request);

  @POST(EndPoints.login)
  Future<BaseResponse<AuthModel, dynamic>> loginWithEmail(
      @Body() LoginEmailRequest request);

  @POST(EndPoints.register)
  Future<BaseResponse<AuthModel, dynamic>> register(
      @Body() RegisterRequest request);

  @POST(EndPoints.sendCode)
  Future<BaseResponse> forgetPasswordWithEmail(
      @Body() ForgetPasswordWithEmailRequest request);

  @POST(EndPoints.sendCode)
  Future<BaseResponse> forgetPasswordWithPhone(
      @Body() ForgetPasswordWithPhoneRequest request);

  @POST(EndPoints.checkCode)
  Future<BaseResponse<AuthModel, dynamic>> checkCode(
      @Body() CheckCodeRequest request);

  @PUT(EndPoints.changePassword)
  Future<BaseResponse<AuthModel, dynamic>> changePassword(
      @Body() ChangePasswordRequest request);
}
