import 'dart:convert';

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
  Future<Response<dynamic>?> addProduct(productDatas) async {
    final response = await dio.post(
      'add-product',
      data: jsonEncode(
        productDatas,
      ),
    );
    return response;
  }
}
