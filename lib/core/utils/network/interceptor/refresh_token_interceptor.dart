import 'package:dio/dio.dart';

class RefreshTokenInterceptor extends Interceptor {
  RefreshTokenInterceptor(this.dio);

  final Dio dio;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Erişim tokenı süresi dolmuş olabilir. Erişim tokenını yenile ve isteği tekrar dene.
      // try {
      //   // Erişim tokenını yenile
      //   final response = await dio.post('/auth/refresh', data: {
      //     'refreshToken': "refreshToken",
      //   });

      //   // Yenilenen erişim tokenını Dio nesnesine ekle
      //   dio.options.headers['Authorization'] = 'Bearer ${response.data['accessToken']}';

      //   // Yeniden denemek için orijinal isteği tekrar yapabilirsiniz.
      //   final retryResponse = await dio.fetch(err.requestOptions);
      //   handler.resolve(retryResponse);
      // } catch (e) {
      //   // Erişim tokenını yenileyemediysen, isteği reddet.
      //   handler.reject(err);
      // }
    } else {
      // Erişim tokenı süresi dolmamışsa veya başka bir hata varsa, isteği reddet.
      handler.reject(err);
    }
  }
}
