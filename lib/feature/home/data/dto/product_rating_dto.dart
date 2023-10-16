import 'package:json_annotation/json_annotation.dart';

part 'product_rating_dto.g.dart';

@JsonSerializable()
class ProductRatingDto {
  double? rate;
  int? count;

  ProductRatingDto({
    this.rate,
    this.count,
  });

  factory ProductRatingDto.fromJson(Map<String, dynamic> json) => _$ProductRatingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRatingDtoToJson(this);
}
