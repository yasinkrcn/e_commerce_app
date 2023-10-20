import 'package:e_commerce_app/feature/auth/view/page/splash_page.dart';
import 'package:e_commerce_app/feature/basket/view/page/basket_page.dart';
import 'package:e_commerce_app/feature/favorites/view/page/favorites_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_commerce_app/feature/home/view/page/home_page.dart';

class PageRoutes {
  //? Auth
  static const String splashPage = "/splashPage";
  //? Bottom Nav Bar
  static const String bottomNavigationPage = "/bottomNavigationPage";
  //? App
  static const String homePage = "/homePage";
  static const String favoritesPage = "/favoritesPage";
  static const String basketPage = "/basketPage";
  static const String productPage = "/productPage";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PageRoutes.splashPage:
      return CupertinoPageRoute(builder: (_) => const SplashPage());

    case PageRoutes.favoritesPage:
      return CupertinoPageRoute(builder: (_) => const FavoritesPage());

    case PageRoutes.basketPage:
      return CupertinoPageRoute(builder: (_) => const BasketPage());

    // case PageRoutes.productPage:
    //   return CupertinoPageRoute(builder: (_) => const ProductPage());

    case PageRoutes.homePage:
      return CupertinoPageRoute(builder: (_) => const HomePage());

    default:
      return CupertinoPageRoute(builder: (_) => const SplashPage());
  }
}
