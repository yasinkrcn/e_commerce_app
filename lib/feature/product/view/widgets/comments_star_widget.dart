import 'package:e_commerce_app/core/_core_exports.dart';

class CommentsStarWidget extends StatelessWidget {
  final double initialRating;
  const CommentsStarWidget({
    super.key,
    required this.initialRating,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      ignoreGestures: true,
      maxRating: 5,
      itemSize: 20,
      initialRating: initialRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
