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
            body: AppWidgetBuilderByState.none(
          response: controller.products,
          builder: (products) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
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
                    onTap: () => sl<HomeController>().goSelectedProduct(context, product: res),
                    // likeOnTap: () => sl<FavoriteController>().saveProductToLocal("${res.id}"),
                    isFavorite: true,
                    productImage: res.image,
                    productName: res.title,
                    productPrice: res.price,
                    rating: res.rating.rate!,
                    ratingCount: res.rating.count!,
                  );
                },
              ),
            );
          },
        ));
      },
    );
  }
}
