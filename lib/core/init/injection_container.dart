import 'package:dio/dio.dart';
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

  final secureStorageManager = SecureStorageManager();
  sl.registerLazySingleton<SecureStorageManager>(() => secureStorageManager);

  sl.registerLazySingleton<BaseController>(() => BaseController());

  // //? Home
  sl.registerLazySingleton(() => HomeService(sl()));
  sl.registerLazySingleton<HomeController>(() => HomeController(sl()));

  // sl.registerLazySingleton<Account>(() => Account(sl(), sl()));

  // //? Number Verify

  // sl.registerLazySingleton<NumberVerifyController>(() => NumberVerifyController(sl()));

  // //? Register
  // sl.registerLazySingleton(() => AuthService(sl()));
  // sl.registerLazySingleton<RegisterController>(() => RegisterController(sl()));
  // sl.registerLazySingleton<LoginController>(() => LoginController(sl()));

  // sl.registerLazySingleton(() => ConstantService(sl()));
  // sl.registerLazySingleton<ConstantController>(() => ConstantController(sl()));

  // //? BottomNavBar
  // sl.registerLazySingleton<BottomNavBarController>(() => BottomNavBarController());

  // //? Home
  // sl.registerLazySingleton<HomeController>(() => HomeController());

  // //? Search
  // sl.registerLazySingleton<SearchingController>(() => SearchingController());

  // //? Profile
  // sl.registerLazySingleton<ProfileController>(() => ProfileController());
}
