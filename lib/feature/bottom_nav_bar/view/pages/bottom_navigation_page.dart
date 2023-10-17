import 'package:e_commerce_app/feature/bottom_nav_bar/_bottom_navigation_bar_exports.dart';
import '../../../../core/_core_exports.dart';

class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Consumer(
        builder: (BuildContext context, BottomNavBarController provider, Widget? child) {
          return Scaffold(
            backgroundColor: provider.selectedBarState.pageBackGroundColor(),
            bottomNavigationBar: SafeArea(child: CustomBottomNavigationBar()),
            body: provider.selectedBarState.buildBody(),
          );
        },
      ),
    );
  }
}
