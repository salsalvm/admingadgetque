import 'dart:developer';

import 'package:admin/view/constants/url.dart';
import 'package:dio/dio.dart';

class ProductServicesEndPoint {
  final dio = Dio(BaseOptions(
    baseUrl: kBaseUrl,
    responseType: ResponseType.plain,
  ));

  //------------------get-------------------//
  Future<Response<dynamic>?> getProductDatas() async {
    final response = await dio.get(
      '',
    );
    return response;
  }

  //------------------add-------------------//
  Map<String, String> requestHeadder = {
    "Content-Type": "multipart/form-data",
  };
  Future<Response<dynamic>?> addProduct(FormData formData) async {
    try {
      final response = await dio.post('add-product',
          data: formData, options: Options(headers: requestHeadder));
      return response;
    } catch (e) {
      log('service catch>>>>>>>>>>$e>>>>>>>>>>>');
    }
    return null;
  }

  //------------------delete-------------------//
  Future<Response<dynamic>?> deleteProduct(String productId) async {
    log('start service');
    try {
      final response = await dio.get('delete-product/$productId');
      log('end service');
      return response;
    } catch (e) {
      log('delete catch service<<<<<<<<<<<<<<<<<<<<<<<$e>>>>>>>>>>>>>>>>>');
    }
    return null;
  }
}
