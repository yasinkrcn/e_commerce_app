import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constants/app_constants.dart';
import 'package:e_commerce_app/core/utils/network/interceptor/refresh_token_interceptor.dart';

class DioManager {
  static Dio getDio() {
    Dio dio = Dio();

    dio.options.baseUrl = AppConstants.baseUrl;

    // String accessToken =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjk2MTYyNDUwLCJleHAiOjE2OTYxNjYwNTB9.uODdo54-yMvcejmA71aejM_RPYudB8KGIEiteX2qB_s";

    dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      // "Authorization": "Bearer $accessToken"
    };

    dio.options.responseType = ResponseType.plain;

    dio.interceptors.add(RefreshTokenInterceptor(dio));

    dio.interceptors.add(LogInterceptor(requestBody: true, error: true, responseBody: true));
    return dio;
  }
}
