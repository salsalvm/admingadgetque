import 'dart:developer';

import 'package:admin/model/product/product_model.dart';
import 'package:admin/model/services/product_services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductController extends GetxController {
  List<Product>? product;
  getDatas() async {
    try {
      final response = await ProductServices().getProductDatas();

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = productDatasModelFromJson(response.data);

        product = datas.products.obs;

        update();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getDatas();
    super.onInit();
  }
}
