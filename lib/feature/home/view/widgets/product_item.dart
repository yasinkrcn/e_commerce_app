import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/feature/product/view/widgets/comments_star_widget.dart';

class ProductItem extends StatefulWidget {
  final String productName;
  final double productPrice;
  final String productImage;
  final double rating;
  final int ratingCount;
  final void Function()? onTap;
  final void Function()? likeOnTap;
  final bool isFavorite;
  const ProductItem({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    this.onTap,
    required this.rating,
    required this.ratingCount,
    this.likeOnTap,
    required this.isFavorite,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
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
                      imageUrl: widget.productImage,
                      borderRadius: 12,
                      height: 170.h,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: InkWell(
                      onTap: widget.likeOnTap,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            !widget.isFavorite ? Icons.favorite_border : Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AppText(
                widget.productName,
                style: TextStyle(color: Colors.grey.shade700),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  CommentsStarWidget(initialRating: widget.rating),
                  12.widthR,
                  AppText(
                    widget.ratingCount.toString(),
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText('\$${widget.productPrice}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
