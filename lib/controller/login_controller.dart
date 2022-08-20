import 'package:admin/model/login_model.dart';
import 'package:admin/services/auth_services.dart';
import 'package:admin/view/constants/color.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:admin/view/screens/dashboard_page/screen_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  loginAdmin(String mail, String password) async {
    isLoading(true);
    if (mail == 'ameen123@gmail.com' && password == 'asdf') {
      Map<String, dynamic> adminData = {
        'email': mail,
        'password': password,
      };

      final response = await AuthServicesEndPoint().checkLogin(adminData);

      try {
        if (response!.statusCode == 200 || response.statusCode == 201) {
          loginModelFromJson(response.data);
          Get.off(
            const ScreenDashboard(),
          );

          Get.snackbar(
            'welcome cheif',
            'to check daily collection',
            colorText: kGreenColor,
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
          );
        } else {
          Get.snackbar(
            'Login Error',
            'entered null response',
            snackPosition: SnackPosition.BOTTOM,
            colorText: kredColor,
          );
        }
      } catch (e) {
        isLoading(false);
        Get.snackbar(
          'Login Error',
          'you are a fake admin',
          snackPosition: SnackPosition.BOTTOM,
          colorText: kredColor,
        );
      } finally {
        isLoading(false);
      }
    } else {
      isLoading(false);
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          'Login Error',
          'please enter valid admin data',
          colorText: kredColor);
      return;
    }
  }

  logoutAdmin() async {
    try {
      final response = await AuthServicesEndPoint().checkLogout();
      if (response!.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          'signout successfully',
          'please visit once again',
          snackPosition: SnackPosition.BOTTOM,
          colorText: kredColor,
        );
        Get.offAll(ScreenLogin());
      }
    } catch (e) {
      Get.snackbar(
        'signout error',
        'please try again',
        snackPosition: SnackPosition.BOTTOM,
        colorText: kredColor,
      );
    }
  }
}
