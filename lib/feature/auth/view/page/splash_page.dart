import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/feature/auth/controller/auth_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    sl<AuthController>().checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AssetPaths().basketSVG),
        96.heightR,
        const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ],
    ));
  }
}
