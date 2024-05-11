// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../../../core/logic/singleton/statics.dart';
import '../../data/requests/change_password_request.dart';
import '../../data/requests/check_code_request.dart';
import '../../data/requests/forget_password_request.dart';
import '../../network/repo/authentication_repo.dart';

class ForgetPasswordProvider extends ChangeNotifier{
  TextEditingController phoneOrEmailController = TextEditingController();

  Future<void> forgetPasswordWithEmail(ForgetPasswordWithEmailRequest request,BuildContext context) async {
    await AuthenticationRepo().forgetPasswordWithEmail(request).then((value) {
      if (value.success) {

      }
    });
  }

  Future<void> forgetPasswordWithPhone(ForgetPasswordWithPhoneRequest request,BuildContext context) async {
    await AuthenticationRepo().forgetPasswordWithPhone(request).then((value) {
      if (value.success) {

      }
    });
  }

  Future<void> checkCode(CheckCodeRequest request,BuildContext context) async {
    await AuthenticationRepo().checkCode(request).then((value) {
      if (value.success) {
        Map<String, dynamic> data = {
          keys.token: value.data!.accessToken,
          keys.fullName: value.data!.user.fullname,
          keys.email: value.data!.user.email,
          keys.phone: value.data!.user.phone,
          keys.dateOfBirth: value.data!.user.dataOfBirth,
          keys.isManager: value.data!.user.isAdmin
        };

        box.saveFromMap(map: data);
        if(value.data!.user.isAdmin){
          context.pushReplacement('/admin');
        }else{
          context.pushReplacement('/user');
        }
      }
    });
  }

  Future<void> changePassword(ChangePasswordRequest request,BuildContext context) async {
    await AuthenticationRepo().changePassword(request).then((value) {
      if (value.success) {

      }
    });
  }
}
