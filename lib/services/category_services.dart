import 'dart:developer';

import 'package:admin/view/constants/url.dart';
import 'package:dio/dio.dart';

class CategoryServicesEndPoint {
  final dio = Dio(
    BaseOptions(baseUrl: kBaseUrl, responseType: ResponseType.plain),
  );
  //------------------get-------------------//
  Future<Response<dynamic>?> getCategory() async {
    try {
      final response = await dio.get('view-category');
    return response;
    } catch (e) {
            log('service catch>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');

    }return null;
  }

//------------------add-------------------//
  Map<String, dynamic> requestHeader = {"Content-Type": "multipart/form-data"};
  Future<Response<dynamic>?> addCategory(FormData formDatas) async {
    try {
      final respose = await dio.post('add-category',
          data: formDatas, options: Options(headers: requestHeader));
      return respose;
    } catch (e) {
      log('service catch>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }

//------------------delete-------------------//
  Future<Response<dynamic>?> deleteCategory(String categoryId) async {
    try {
      final respose = await dio.get('delete-category/?id=$categoryId');

      return respose;
    } catch (e) {
      log('service delete>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<');
    }
    return null;
  }

//------------------update-------------------//
  Future<Response<dynamic>?> updateCategory(
      String categoryId, FormData formData) async {
    try {
      final response = await dio.post('edit-category/$categoryId',
          data: formData, options: Options(headers: requestHeader));
      log(response.toString());
      return response;
    } catch (e) {
      log('service update>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<');
    }
    return null;
  }
}
