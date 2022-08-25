import 'dart:developer';

import 'package:admin/model/dashboard_model.dart';
import 'package:admin/services/dashboard_services.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  Rx<int?>? user;
  Rx<int?>? todayCollection;
  List<TopSelling>? topSellings;
  //------------------get-------------------//
  getDashboard() async {
    try {
      final response = await DashboardServicesEndPoint().getDashboard();

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = dashboardModelFromJson(response.data);
        if (datas != null) {
          if (datas.admin) {
            user = datas.totalUsers.obs;
            todayCollection = datas.currentDaySale.obs;
            topSellings = datas.topSelling!.obs;
            update();
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getDashboard();
  }
}
