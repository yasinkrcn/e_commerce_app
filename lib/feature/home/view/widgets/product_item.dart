import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/feature/favorites/controller/favorite_controller.dart';
import 'package:e_commerce_app/feature/product/view/widgets/comments_star_widget.dart';

class ProductItem extends StatelessWidget {
  final ProductDto product;

  final void Function()? onTap;

  const ProductItem({
    super.key,
    this.onTap,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: AppImage.custom(
                      imageUrl: product.image,
                      borderRadius: 12,
                      height: 170.h,
                    ),
                  ),
                  AppText(
                    product.title,
                    style: TextStyle(color: Colors.grey.shade700),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      CommentsStarWidget(initialRating: product.rating.rate!),
                      12.widthR,
                      AppText(
                        product.rating.count.toString(),
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText('\$${product.price}'),
                  ),
                ],
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Consumer(
                  builder: (context, FavoriteController favoriteController, child) {
                    return InkWell(
                      onTap: () => favoriteController.productLikeFunc("${product.id}"),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            favoriteController.saveProductList.any((element) => product.id.toString() == element)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
