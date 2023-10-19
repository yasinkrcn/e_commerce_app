import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/feature/basket/controller/basket_controller.dart';

class BasketProductCard extends StatelessWidget {
  final ProductDto product;

  const BasketProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, BasketController basketController, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppImage.custom(
                      borderRadius: 16,
                      imageUrl: product.image,
                      height: 102.w,
                      width: 102.w,
                    ),
                    16.widthR,
                    Expanded(
                      child: AppText(
                        product.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        basketController.removeBasketProduct(product);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade300),
                        child: Icon(Icons.delete_outline_outlined, color: Colors.grey.shade700),
                      ),
                    ),
                    AppText(
                      product.price.toString(),
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
