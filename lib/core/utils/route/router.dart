import 'package:flutter/cupertino.dart';
import 'package:e_commerce_app/feature/home/view/page/home_page.dart';

class PageRoutes {
  //? Auth
  static const String loginPage = "/loginPage";
  static const String numberVerifyPage = "/numberVerifyPage";
  static const String registerGeneralInfoPage = "/registerGeneralInfoPage";
  static const String usedFootPage = "/usedFootPage";
  static const String playedPositionsPage = "/playedPositionsPage";
  static const String yourAbilitiesPage = "/yourAbilitiesPage";
  //? Bottom Nav Bar
  static const String bottomNavigationPage = "/bottomNavigationPage";
  //? Home
  static const String homePage = "/homePage";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PageRoutes.homePage:
      return CupertinoPageRoute(builder: (_) => const HomePage());

    default:
      return CupertinoPageRoute(builder: (_) => const HomePage());
  }
}
