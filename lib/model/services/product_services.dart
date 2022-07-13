import 'package:admin/view/core/url.dart';
import 'package:dio/dio.dart';

class ProductServices {
  final dio = Dio(BaseOptions(
    responseType: ResponseType.plain,
  ));
  Future<Response<dynamic>?> getProductDatas() async {
    final response = await dio.get(kBaseUrl);

    return response;
  }
}
