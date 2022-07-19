import 'dart:convert';
import 'dart:developer';

import 'package:admin/view/core/url.dart';
import 'package:dio/dio.dart';

class ProductServicesEndPoint {
  final dio = Dio(BaseOptions(
    baseUrl: kBaseUrl,
    responseType: ResponseType.plain,
  ));

  //>>>>>>>>>>>>>>.get product<<<<<<<<<<<<<<<<<//
  Future<Response<dynamic>?> getProductDatas() async {
    final response = await dio.get(
      '',
    );
    return response;
  }

//>>>>>>>>>>>>>>>>.add product<<<<<<<<<<<<<<<<<//
  Future<Response<dynamic>?> addProduct(
      Map<String, String> requestHeadder, FormData formData) async {
    // log(formData.toString());
    // log(requestHeadder.toString());
    try {
      final response = await dio.post('add-product',
          data: jsonEncode(formData),
          options: Options(headers: requestHeadder));
      return response;
    } catch (e) {
      log(e.toString());
    }return null;
  }
}
