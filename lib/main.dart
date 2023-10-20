import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/feature/auth/view/page/splash_page.dart';
import '/core/init/injection_container.dart' as locator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locator.init();
  runApp(
    MultiProvider(
      providers: MainProviderList.getMainProviderList(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants().appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      navigatorKey: GlobalContextKey.instance.globalKey,
      onGenerateRoute: generateRoute,
      home: const SplashPage(),
    );
  }
}
