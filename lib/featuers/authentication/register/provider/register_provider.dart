// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../../../core/logic/singleton/statics.dart';
import '../../data/requests/register_request.dart';
import '../../network/repo/authentication_repo.dart';

class RegisterProvider extends ChangeNotifier {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  Future<void> register(RegisterRequest request,BuildContext context) async {
    await AuthenticationRepo().register(request).then((value) {
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
}
