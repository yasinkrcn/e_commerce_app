import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/feature/product/view/widgets/comments_star_widget.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final double productPrice;
  final String productImage;
  final double rating;
  final int ratingCount;
  final void Function()? onTap;
  const ProductItem({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    this.onTap,
    required this.rating,
    required this.ratingCount,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  SizedBox(
                    child: AppImage.custom(
                      imageUrl: productImage,
                      borderRadius: 12,
                      height: 170.h,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, border: Border.all(color: Colors.grey.shade300), color: Colors.white),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AppText(
                productName,
                style: TextStyle(color: Colors.grey.shade700),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  CommentsStarWidget(initialRating: rating),
                  12.widthR,
                  AppText(
                    ratingCount.toString(),
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText('\$$productPrice'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
