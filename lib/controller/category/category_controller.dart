import 'dart:developer';

import 'package:admin/model/category/category_model.dart';
import 'package:admin/model/services/category_services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoryController extends GetxController {
  List<Category>? categoryNames;
  getCategory() async {
    try {
      final response = await CategoryServicesEndPoint().checkCategory();

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = viewCategoryModelFromJson(response.data);

        categoryNames = datas.category.obs;
        log(categoryNames.toString());
        update();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }
}
