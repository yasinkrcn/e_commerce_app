import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constants/app_constants.dart';

class DioManager {
  static Dio getDio() {
    Dio dio = Dio();

    dio.options.baseUrl = AppConstants.baseUrl;

    dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };

    dio.options.responseType = ResponseType.plain;

    dio.interceptors.add(LogInterceptor(requestBody: true, error: true, responseBody: true));
    return dio;
  }
}
