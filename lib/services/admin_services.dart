import 'dart:developer';

import 'package:admin/view/constants/url.dart';
import 'package:dio/dio.dart';

class AdminServicesEndPoint {
  final dio = Dio(
    BaseOptions(baseUrl: kBaseUrl, responseType: ResponseType.plain),
  );
  //------------------get-------------------//
  Future<Response<dynamic>?> getAdmins() async {
    try {
      final response = await dio.get('view-users');

      return response;
    } catch (e) {
      log('service catch>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }

  //------------------block-------------------//
  Future<Response<dynamic>?> blockAdmins(String uId) async {
    try {
      final response = await dio.post('block-user/$uId');

      return response;
    } catch (e) {
      log('service catch>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }

  //------------------un block-------------------//
  Future<Response<dynamic>?> unBlockAdmins(String uId) async {
    try {
      final response = await dio.post('unblock-user/$uId');

      return response;
    } catch (e) {
      log('service catch>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }

  //------------------get-------------------//
  Future<Response<dynamic>?> deleteAdmins(String uId) async {
    try {
      final response = await dio.get('delete-user/$uId');

      return response;
    } catch (e) {
      log('service catch>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }
}
