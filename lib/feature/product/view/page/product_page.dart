import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/feature/product/view/widgets/comments_star_widget.dart';

class ProductPage extends StatelessWidget {
  final ProductDto product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    16.height,
                    AppImage.custom(imageUrl: product.image),
                    16.height,
                    AppText(
                      product.title,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    16.height,
                    Row(
                      children: [
                        CommentsStarWidget(initialRating: product.rating.rate!),
                        12.widthR,
                        AppText(product.rating.rate.toString()),
                        12.widthR,
                        AppText(
                          "${product.rating.count} reviews",
                          style: TextStyle(
                            color: Colors.orange.shade800,
                          ),
                        ),
                      ],
                    ),
                    16.height,
                    AppText(product.description),
                    16.height,
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade200))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: AppText(
                      "\$${product.price}",
                      style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 24),
                    ),
                  ),
                ),
                16.widthR,
                Container(
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.add_shopping_cart_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
