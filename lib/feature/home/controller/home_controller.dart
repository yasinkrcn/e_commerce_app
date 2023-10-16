import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/feature/home/data/dto/product_dto.dart';
import 'package:e_commerce_app/feature/home/data/service/home_service.dart';
import 'package:e_commerce_app/feature/product/view/page/product_page.dart';

class HomeController extends BaseController {
  final HomeService _apiService;

  HomeController(this._apiService) {
    // fetchProducts();
    fetchCategories();
  }
  UIState<List<ProductDto>> products = UIState.idle();

  UIState<List<String>> categories = UIState.idle();

  // Products

  Future<void> fetchProducts() async {
    products = UIState.loading();
    await getProducts();
    refreshView();
  }

  Future<void> getProducts() async {
    final resEither = await ApiRequest.request(apiCall: () => _apiService.getProductInformations());
    products = resEither.fold(
      (failure) => UIState.error(failure),
      (data) => UIState.success(data),
    );
  }

  // Categories

  Future<void> fetchCategories() async {
    categories = UIState.loading();
    await getCategories();
    refreshView();
  }

  Future<void> getCategories() async {
    final resEither = await ApiRequest.request(apiCall: () => _apiService.getCategories());
    categories = resEither.fold(
      (failure) => UIState.error(failure),
      (data) => UIState.success(data),
    );
  }

  // CategoryProducts

  Future<void> fetchProductFromSelectedCategory(String categoryName) async {
    products = UIState.loading();
    await getProductFromSelectedCategory(categoryName);
    refreshView();
  }

  Future<void> getProductFromSelectedCategory(String categoryName) async {
    final resEither = await ApiRequest.request(apiCall: () => _apiService.getSelectedCategoryProducts(categoryName));
    products = resEither.fold(
      (failure) => UIState.error(failure),
      (data) => UIState.success(data),
    );
  }

  void goSelectedProduct(BuildContext context, {required ProductDto product}) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductPage(
                product: product,
              )),
    );
  }
}
