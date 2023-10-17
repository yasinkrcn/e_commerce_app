import 'package:e_commerce_app/feature/bottom_nav_bar/view_model/bottom_navigation_bar_view_model.dart';
import 'package:e_commerce_app/feature/favorites/controller/favorite_controller.dart';
import 'package:e_commerce_app/feature/home/controller/home_controller.dart';
import 'package:provider/single_child_widget.dart';
import 'package:e_commerce_app/core/_core_exports.dart';

class MainProviderList {
  /// This list includes providers that should stand up when the application starts.
  static List<SingleChildWidget> mainProviderlist = [
    ChangeNotifierProvider<BaseController>(create: (_) => sl<BaseController>()),
    ChangeNotifierProvider<HomeController>(create: (_) => sl<HomeController>()),
    ChangeNotifierProvider<BottomNavBarController>(create: (_) => sl<BottomNavBarController>()),
    ChangeNotifierProvider<FavoriteController>(create: (_) => sl<FavoriteController>()),
  ];

  /// This method returns the provider list that should stand up at the beginning of the application.
  static List<SingleChildWidget> getMainProviderList() {
    return mainProviderlist;
  }
}
