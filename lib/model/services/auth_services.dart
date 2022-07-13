import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio(
    BaseOptions(
        baseUrl: 'http://10.0.2.2:3000/admin/',
        responseType: ResponseType.plain),
  );
  Future<Response<dynamic>?> checkLogin(adminData) async {
    try {
      final response = await dio.post('adminlog', data: jsonEncode(adminData));
      log(response.data);
      return response;
    } on DioError catch (e) {
      log(e.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Response<dynamic>?> checkLogout() async {
    final response = await dio.get(
      'logout',
    );
    log(response.data);
    return response;
  }
}
