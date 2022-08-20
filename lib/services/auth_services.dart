import 'dart:convert';
import 'dart:developer';
import 'package:admin/view/constants/url.dart';
import 'package:dio/dio.dart';

class AuthServicesEndPoint {
  final dio = Dio(
    BaseOptions(baseUrl: kBaseUrl, responseType: ResponseType.plain),
  );
   //------------------log in-------------------//
  Future<Response<dynamic>?> checkLogin( adminData) async {
    try {
      final response = await dio.post('adminlog', data: jsonEncode(adminData));
      return response;
    } on DioError catch (e) {
      log(e.toString());
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
 //------------------log out-------------------//
  Future<Response<dynamic>?> checkLogout() async {
    final response = await dio.get(
      'logout',
    );
    log(response.data);
    return response;
  }
}
