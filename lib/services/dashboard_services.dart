import 'dart:developer';

import 'package:admin/view/constants/url.dart';
import 'package:dio/dio.dart';

class DashboardServicesEndPoint {
  final dio = Dio(
    BaseOptions(baseUrl: kBaseUrl, responseType: ResponseType.plain),
  );
  //------------------get-------------------//
  Future<Response<dynamic>?> getDashboard() async {
    try {
      final response = await dio.get('admin-dashboard');
      log(response.toString());
    return response;
    } catch (e) {
            log('service catch>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');

    }return null;
  }
}