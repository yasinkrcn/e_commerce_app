// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_rating_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRatingDto _$ProductRatingDtoFromJson(Map<String, dynamic> json) =>
    ProductRatingDto(
      rate: (json['rate'] as num?)?.toDouble(),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$ProductRatingDtoToJson(ProductRatingDto instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
