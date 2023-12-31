import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/core/shared/app_widget_state_builder.dart';
import 'package:e_commerce_app/feature/favorites/controller/favorite_controller.dart';
import 'package:e_commerce_app/feature/home/controller/home_controller.dart';
import 'package:e_commerce_app/feature/home/view/widgets/product_item.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();

    sl<FavoriteController>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, FavoriteController controller, child) {
        return AppScaffold(
            appBar: AppBar(
              title: AppText("My Favorites"),
              backgroundColor: AppColors.white,
              centerTitle: true,
            ),
            body: AppWidgetBuilderByState.none(
              response: controller.products,
              builder: (products) {
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: .6,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    var res = products[index];
                    return ProductItem(
                      product: res,
                      onTap: () => sl<HomeController>().goSelectedProduct(context, product: res),
                    );
                  },
                );
              },
            ));
      },
    );
  }
}
