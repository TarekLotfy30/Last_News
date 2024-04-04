import 'package:dio/dio.dart';
import 'package:last_news/view_model/data/remote/constants/endpoints.dart';

class DioHelper {
  static Dio? dio;

  // Private constructor to prevent instantiation
  DioHelper._();

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseURl,
        receiveDataWhenStatusError: true,
        headers: {},
      ),
    );
  }

  static Future<Response?> get({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    return await dio?.get(
      endPoint,
      queryParameters: params,
      data: body,
    );
  }
}
