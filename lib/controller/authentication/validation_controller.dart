import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';

class ValidationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }
  var pass = false.obs;
  var email = false.obs;
  var passController = '';
  var emailController = '';
  mailValidation(String mail) {
    // log('=====validation called====');
    if (!GetUtils.isEmail(mail)) {
      email.value = true;
      print(email);
    } else {
      email.value = false;
      emailController = mail;
    }
  }

  passwordValidation(String password) {
    if (password.length < 4) {
      pass.value = true;
    } else {
      pass.value = false;
      passController = password;
    }
  }
}
