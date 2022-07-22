import 'dart:developer';

import 'package:admin/view/core/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CategoryServicesEndPoint {
  final dio = Dio(
    BaseOptions(baseUrl: kBaseUrl, responseType: ResponseType.plain),
  );
  Future<Response<dynamic>?> checkCategory() async {
    final response = await dio.get('view-category');
    return response;
  }

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

  Future<Response<dynamic>?> deleteCategory(String categoryId) async {
    try {
      final respose = await dio.get('delete-category/?id=$categoryId');

      return respose;
    } catch (e) {
      log('service delete>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<');
    }
    return null;
  }
}
