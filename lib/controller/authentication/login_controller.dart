import 'dart:developer';

import 'package:admin/model/services/auth_services.dart';
import 'package:admin/view/authentication/screen_login.dart';
import 'package:admin/view/core/color.dart';
import 'package:admin/view/dashboard/screen_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class LoginController extends GetxController {
  loginAdmin(String mail, String password) async {
    Map<String, dynamic> adminData = {
      'email': mail,
      'password': password,
    };
    log('<<<<<<<<$adminData>>>>>>>>>');
    final response = await ApiServices().checkLogin(adminData);

    try {
      if (response!.statusCode == 200) {
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
      Get.snackbar(
        'Login Error',
        'you are a fake admin',
        snackPosition: SnackPosition.BOTTOM,
        colorText: kredColor,
      );
    }
  }

  logoutAdmin() async {
    try {
      final response = await ApiServices().checkLogout();
      if (response!.data == null) {
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
        'please visit try again',
        snackPosition: SnackPosition.BOTTOM,
        colorText: kredColor,
      );
      rethrow;
    }
  }
}
