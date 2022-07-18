import 'package:admin/view/core/url.dart';
import 'package:dio/dio.dart';

class CategoryServicesEndPoint {
  final dio = Dio(
    BaseOptions(baseUrl: kBaseUrl, responseType: ResponseType.plain),
  );
  Future<Response<dynamic>?> checkCategory() async {
    final response = await dio.get('view-category');
    return response;
  }
}
