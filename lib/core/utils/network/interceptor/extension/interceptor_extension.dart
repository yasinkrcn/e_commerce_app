import 'package:dio/dio.dart';

extension InterceptorExtension on Interceptor {
  Future<void> retryRequest(Dio dio, {required DioException error, required ErrorInterceptorHandler handler}) async {
    dio.options.baseUrl = error.requestOptions.baseUrl;

    Response response = await dio.request(
      error.requestOptions.path,
      data: error.requestOptions.data,
      queryParameters: error.requestOptions.queryParameters,
      options: Options(
        method: error.requestOptions.method,
        headers: error.requestOptions.headers,
      ),
    );
    return handler.resolve(response);
  }
}
