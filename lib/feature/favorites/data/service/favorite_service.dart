import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/network/main_endpoints.dart';
import 'package:e_commerce_app/feature/home/data/dto/product_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'favorite_service.g.dart';

@RestApi()
abstract class FavoriteService {
  factory FavoriteService(Dio dio) = _FavoriteService;

  @GET("${MainEndpoints.products}/{productId}")
  Future<ProductDto> getSelectedProducts(
    @Path() String productId,
  );
}
