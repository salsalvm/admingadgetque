import 'dart:developer';

import 'package:admin/view/constants/url.dart';
import 'package:admin/view/screens/my_order_page/widget/list_order.dart';
import 'package:dio/dio.dart';

class OrderServicesEndPoint {
  final dio = Dio(
    BaseOptions(baseUrl: kBaseUrl, responseType: ResponseType.plain),
  );
  //------------------get order-------------------//
  Future<Response<dynamic>?> getOrder() async {
    try {
      final response = await dio.get('admin-orders');

      return response;
    } catch (e) {
      log('service catch>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }

  //------------------status oProduct-------------------//
  Future<Response<dynamic>?> statusUpdateOrder(String oId,String status) async {
   Map<String,dynamic>oStatus={'status':status};
    try {
      final response = await dio.post('status-update/$oId',data: oStatus);
      log(response.toString());
      return response;
    } catch (e) {
      log('service catch>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }

  //------------------get oProduct-------------------//
  Future<Response<dynamic>?> viewOrderProduct(String oId) async {
    try {
      final response = await dio.get('admin-product-details/$oId');
      log(oId);
      return response;
    } catch (e) {
      log('service catch>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }
}
