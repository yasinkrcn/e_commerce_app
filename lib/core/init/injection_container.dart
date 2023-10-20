import 'package:dio/dio.dart';
import 'package:e_commerce_app/feature/auth/controller/auth_controller.dart';
import 'package:e_commerce_app/feature/basket/controller/basket_controller.dart';
import 'package:e_commerce_app/feature/bottom_nav_bar/view_model/bottom_navigation_bar_view_model.dart';
import 'package:e_commerce_app/feature/favorites/controller/favorite_controller.dart';
import 'package:e_commerce_app/feature/favorites/data/service/favorite_service.dart';
import 'package:e_commerce_app/feature/home/controller/home_controller.dart';
import 'package:e_commerce_app/feature/home/data/service/home_service.dart';
import 'package:get_it/get_it.dart';
import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/core/utils/network/dio_manager.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //! Core

  //?Network
  sl.registerLazySingleton<Dio>(() => DioManager.getDio());

  //?Secure Storage
  final secureStorageManager = SecureStorageManager();
  sl.registerLazySingleton<SecureStorageManager>(() => secureStorageManager);

  // //? BaseController

  sl.registerLazySingleton<BaseController>(() => BaseController());

  // //? BottomNavBar
  sl.registerLazySingleton<BottomNavBarController>(() => BottomNavBarController());

  // //? Auth
  sl.registerLazySingleton<AuthController>(() => AuthController());

  // //? Home
  sl.registerLazySingleton(() => HomeService(sl()));
  sl.registerLazySingleton<HomeController>(() => HomeController(sl()));

  // //? Favorites
  sl.registerLazySingleton(() => FavoriteService(sl()));
  sl.registerLazySingleton<FavoriteController>(() => FavoriteController(
        sl(),
        sl(),
      ));

  // //? Basket

  sl.registerLazySingleton<BasketController>(() => BasketController());
}
