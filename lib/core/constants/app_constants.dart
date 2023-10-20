import 'dart:ui';

class AppConstants {
  static final AppConstants _instance = AppConstants._init();
  AppConstants._init();

  factory AppConstants() {
    return _instance;
  }

  ///Tasarımda bulunan cihazın ekran boyutları
  Size designDeviceSize = const Size(428, 835);
  // Size designDeviceSize = const Size(375, 812);

  String appName = "E-commerce";

  static const String slug = "{slug}";

  // static const String baseUrl = "https://jsonplaceholder.typicode.com/";
  static const String baseUrl = "https://fakestoreapi.com/";
}
