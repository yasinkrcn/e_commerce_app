// ignore_for_file: constant_identifier_names

import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/feature/basket/view/page/basket_page.dart';
import 'package:e_commerce_app/feature/home/view/page/home_page.dart';
import 'package:e_commerce_app/feature/favorites/view/page/favorites_page.dart';

enum BottomNavigationBarState { HOME, HEART, BASKET }

extension BottomNavigationBarStateExtension on BottomNavigationBarState {
  int stateToPageIndex() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return 0;
      case BottomNavigationBarState.HEART:
        return 1;
      case BottomNavigationBarState.BASKET:
        return 2;
    }
  }

  BottomNavigationBarState indexToState(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return BottomNavigationBarState.HOME;
      case 1:
        return BottomNavigationBarState.HEART;
      case 2:
        return BottomNavigationBarState.BASKET;

      default:
        return BottomNavigationBarState.HOME;
    }
  }

  Color stateToActiveColor() {
    switch (this) {
      case BottomNavigationBarState.HOME:
      case BottomNavigationBarState.HEART:
      case BottomNavigationBarState.BASKET:
        return AppColors.mainPrimary;
    }
  }

  String stateToAssetPath() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return AssetPaths().homeSVG;
      case BottomNavigationBarState.HEART:
        return AssetPaths().heartSVG;

      case BottomNavigationBarState.BASKET:
        return AssetPaths().basketSVG;
    }
  }

  double stateToAssetPathSize() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return 30.h;
      case BottomNavigationBarState.HEART:
        return 30.h;

      case BottomNavigationBarState.BASKET:
        return 30.h;
    }
  }

  String stateToTitle() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return "Home";
      case BottomNavigationBarState.HEART:
        return "Favorites";
      case BottomNavigationBarState.BASKET:
        return "Basket";
    }
  }

  Widget buildBody() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return const HomePage();
      case BottomNavigationBarState.HEART:
        return const FavoritesPage();
      case BottomNavigationBarState.BASKET:
        return const BasketPage();
    }
  }

  Color pageBackGroundColor() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return AppColors.white;
      case BottomNavigationBarState.HEART:
        return AppColors.white;
      case BottomNavigationBarState.BASKET:
        return AppColors.white;
    }
  }
}
