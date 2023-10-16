import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/network/main_endpoints.dart';
import 'package:e_commerce_app/feature/home/data/dto/product_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio) = _HomeService;

  @GET(MainEndpoints.products)
  Future<List<ProductDto>> getProductInformations();

  @GET("${MainEndpoints.category}/{categoryName}")
  Future<List<ProductDto>> getSelectedCategoryProducts(
    @Path() String categoryName,
  );

  @GET(MainEndpoints.categories)
  Future<List<String>> getCategories();
}
