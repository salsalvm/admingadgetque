import 'dart:developer';

import 'package:admin/model/order/get_order_model.dart';
import 'package:admin/model/order/view_order_producr_model.dart';
import 'package:admin/services/order_services.dart';
import 'package:admin/view/screens/my_order_page/screen_view_product.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  List<AllOrder>? allOrder;
  List<ProductElement>? products;

  //------------------get oDet-------------------//
  getOrderDetails() async {
    try {
      final response = await OrderServicesEndPoint().getOrder();
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = allOrdersFromJson(response.data);
        if (datas.admin!) {
          if (datas.allOrders != null) {
            allOrder = datas.allOrders!.obs;
            update();
          }
        }
      }
    } catch (e) {
      log('get controller>>>>>>>>$e<<<<<<<<');
    }
  }

  //------------------get oProd-------------------//
  viewOrderProduct(String oId) async {
    try {
      final response = await OrderServicesEndPoint().viewOrderProduct(oId);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = viewOrderProductFromJson(response.data);
        if (datas.admin!) {
          if (datas.products != null) {
            products = datas.products!.obs;
            Get.to(const ScreenViewOrder());
          }
        }
      }
    } catch (e) {
      log('get controller>>>>>>>>>>>>$e<<<<<<<<<<');
    }
  }

  //------------------status ord-------------------//
  statusUpdateOrder(String oId,String status ) async {
    try {
      final response = await OrderServicesEndPoint().statusUpdateOrder(oId,status);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = viewOrderProductFromJson(response.data);
        if (datas.admin!) {
          if (datas.products != null) {
            products = datas.products!.obs;
            Get.to(const ScreenViewOrder());
          }
        }
      }
    } catch (e) {
      log('get controller>>>>>>>>>>>>$e<<<<<<<<<<');
    }
  }
  //------------------cancel ord-------------------//
  // cancelOrder(String orderId) async {
  //   try {
  //     final response = await OrderServicesEndPoint().canceOrder(orderId);
  //     if (response!.statusCode == 200 || response.statusCode == 201) {
  //       final datas = cancelOrderModelFromJson(response.data);
  //       if (datas.acknowledged) {
  //         getOrderDetails();
  //         update();
  //         Get.back();
  //         Get.snackbar('cancell order', 'successfully cancelled order',
  //             colorText: kredColor, snackPosition: SnackPosition.BOTTOM);
  //       }
  //     }
  //   } catch (e) {
  //     log('get controller>>>>>>>>>>>>$e<<<<<<<<<<');
  //   }
  // }

  @override
  void onInit() {
    getOrderDetails();

    super.onInit();
  }
}
