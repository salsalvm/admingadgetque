import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';

class ValidationController extends GetxController {
  var pass = false.obs;
  var email = false.obs;
  var passController = '';
  var mailController = '';
  mailValidation(String mail) {
    if (!GetUtils.isEmail(mail)) {
      pass.value = true;
    } else {
      email.value = false;
      mailController = mail;
    }
  }

  passwordValidation(String password) {
    if (password.length < 6) {
      pass.value = true;
    } else {
      pass.value = false;
      passController = password;
    }
  }
}
