// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/feature/bottom_nav_bar/view/pages/_pages_exports.dart';
import 'package:e_commerce_app/feature/favorites/controller/favorite_controller.dart';

class AuthController extends BaseController {
  void checkUser() async {
    await sl<FavoriteController>().readProductToLocal();

    Navigator.push(
        GlobalContextKey.instance.globalKey.currentState!.context,
        MaterialPageRoute(
          builder: (context) => const BottomNavigationPage(),
        ));
  }
}
