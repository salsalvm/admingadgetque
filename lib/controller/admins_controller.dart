import 'dart:developer';

import 'package:admin/model/admin/admin_model.dart';
import 'package:admin/model/admin/block_admin_model.dart';
import 'package:admin/model/admin/delete_admin_model.dart';
import 'package:admin/model/admin/unblock_admin_model.dart';
import 'package:admin/services/admin_services.dart';
import 'package:admin/view/constants/color.dart';
import 'package:get/get.dart';

class AdminActionController extends GetxController {
  List<User>? users;
  //------------------get-------------------//
  getAdmin() async {
    try {
      final response = await AdminServicesEndPoint().getAdmins();
     
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = adminActionsFromJson(response.data);
        if (datas.admin!) {
          users = datas.users!.obs;

          update();
        }
      }
    } catch (e) {
      log('controller get>>>>>>>>>>>>>$e<<<<<<<<<<<<<<');
    }
  }

  //------------------block-------------------//
  blockAdmin(String uId) async {
    try {
      final response = await AdminServicesEndPoint().blockAdmins(uId);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = blockAdminActionsFromJson(response.data);
        if (datas.status) {
          Get.snackbar(
            'Blocked',
            'this user blocked',
            snackPosition: SnackPosition.BOTTOM,
            colorText: kredColor,
          );
        }
        getAdmin();
        update();
      }
    } catch (e) {
      log('controller block>>>>>>>>>>>>>$e<<<<<<<<<<<<<<');
    }
  }

  //------------------delete-------------------//
  deleteAdmin(String uId) async {
    try {
      final response = await AdminServicesEndPoint().deleteAdmins(uId);
   
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = deleteAdminActionsFromJson(response.data);
        if (datas.acknowledged) {
          Get.snackbar(
            'User Deletted',
            'this user is Deletted',
            snackPosition: SnackPosition.BOTTOM,
            colorText: kredColor,
          );
        }
        getAdmin();
        update();
      }
    } catch (e) {
      log('controller block>>>>>>>>>>>>>$e<<<<<<<<<<<<<<');
    }
  }

  //------------------un block-------------------//
  unBlockAdmin(String uId) async {
    try {
      final response = await AdminServicesEndPoint().unBlockAdmins(uId);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = unBlockAdminActionsFromJson(response.data);
        if (datas.status) {
          Get.snackbar(
            'un Blocked',
            'this user is un blocked',
            snackPosition: SnackPosition.BOTTOM,
            colorText: kGreenColor,
          );
        }
        getAdmin();
        update();
      }
    } catch (e) {
      log('controller block>>>>>>>>>>>>>$e<<<<<<<<<<<<<<');
    }
  }

  @override
  void onInit() {
    getAdmin();

    super.onInit();
  }
}
