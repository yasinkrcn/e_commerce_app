import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/core/shared/app_widget_state_builder.dart';
import 'package:e_commerce_app/feature/favorites/controller/favorite_controller.dart';
import 'package:e_commerce_app/feature/home/controller/home_controller.dart';
import 'package:e_commerce_app/feature/home/view/widgets/product_item.dart';

class ProductsTabbar extends StatefulWidget {
  final String selectedCategory;
  const ProductsTabbar({
    super.key,
    required this.selectedCategory,
  });

  @override
  State<ProductsTabbar> createState() => _ProductsTabbarState();
}

class _ProductsTabbarState extends State<ProductsTabbar> {
  @override
  void initState() {
    super.initState();

    sl<HomeController>().fetchProductFromSelectedCategory(widget.selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, HomeController controller, child) {
        return AppWidgetBuilderByState.none(
          response: controller.products,
          builder: (product) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16) + const EdgeInsets.only(top: 16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: .6,
                ),
                itemCount: product.length,
                itemBuilder: (context, index) {
                  ProductDto res = product[index];

                  return ProductItem(
                    product: res,
                    onTap: () => controller.goSelectedProduct(context, product: res),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
