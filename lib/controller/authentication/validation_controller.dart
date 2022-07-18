import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';

class ValidationController extends GetxController {
  var pass = false.obs;
  var email = false.obs;
  var ePrice = false.obs;
  var eName = false.obs;
  var passController = '';
  var emailController = '';
  var ePriceController = '';
  var eNameController = '';
  mailValidation(String mail) {
    if (!GetUtils.isEmail(mail)) {
      email.value = true;
    } else {
      email.value = false;
      emailController = mail;
    }
  }

  productPrice(String price) {
    if (!GetUtils.isNumericOnly(price)) {
      ePrice.value = true;
    } else {
      ePrice.value = false;
      ePriceController = price;
    }
  }

  productName(String name) {
    if (name.length <= 6) {
      eName.value = true;
    } else {
      eName.value = false;
      eNameController = name;
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
