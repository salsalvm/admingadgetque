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

  Map<String, String> requestHeadder = {
    "Content-Type": "multipart/form-data",
  };
//>>>>>>>>>>>>>>>>.add product<<<<<<<<<<<<<<<<<//
  Future<Response<dynamic>?> addProduct(FormData formData) async {
    try {
      final response = await dio.post('add-product',
          data: formData, options: Options(headers: requestHeadder));
      return response;
    } on DioError catch (e) {
      log(e.toString());
      
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
