import 'dart:convert';
import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio(
    BaseOptions(
        baseUrl: 'http://54.175.202.116/admin/',
        responseType: ResponseType.plain),
  );
  Future<Response<dynamic>?> checkLogin(adminData) async {
    final response = await dio.post('adminlog', data: jsonEncode(adminData));
    return response;
  }

  Future<Response<dynamic>?> checkLogout() async {
    final response = await dio.get(
      'logout',
    );
    return response;
  }
}
