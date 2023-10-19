import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/feature/favorites/data/service/favorite_service.dart';

class FavoriteController extends BaseController {
  final SecureStorageManager _secureStorageManager;
  final FavoriteService _apiService;

  FavoriteController(this._secureStorageManager, this._apiService);

  Future<void> productLikeFunc(String productId) async {
    if (!saveProductList.any((element) => element == productId)) {
      await saveProductToLocal(productId);
    } else {
      await deleteProductToLocal(productId);
    }

    refreshView();
  }

  List<String> saveProductList = [];

  Future<void> saveProductToLocal(String productId) async {
    try {
      await readProductToLocal();

      if (!saveProductList.any((element) => element == productId)) {
        saveProductList.add(productId);

        final listAsString = saveProductList.join(';');

        await _secureStorageManager.write(SecureStorageKeys.FAVORITES_INFO, listAsString);

        await readProductToLocal();

        showCustomMessenger(CustomMessengerState.SUCCESS, "Added to favorites");
      }
    } catch (_) {
      showCustomMessenger(CustomMessengerState.WARNING, "Favorilere eklenirken bir sorun oluştu");
    }
  }

  Future<List<String>> readProductToLocal() async {
    var res = await _secureStorageManager.read(
      SecureStorageKeys.FAVORITES_INFO,
    );
    if (res != null) {
      saveProductList = res.split(';'); // Ayraçı kullanarak listeyi bölüyoruz
      return saveProductList;
    } else {
      return [];
    }
  }

  Future<void> deleteProductToLocal(String productId) async {
    if (saveProductList.any((element) => element == productId)) {
      saveProductList.remove(productId);

      final listAsString = saveProductList.join(';');

      await _secureStorageManager.write(SecureStorageKeys.FAVORITES_INFO, listAsString);

      await readProductToLocal();

      showCustomMessenger(CustomMessengerState.WARNING, "Removed from favorites");
    }
  }

  // Products

  UIState<List<ProductDto>> products = UIState.idle();

  Future<void> fetchProducts() async {
    if (productRes.isNotEmpty) {
      products.data.clear();
    }

    productRes.clear();
    await readProductToLocal();
    for (var element in saveProductList) {
      await getProducts(element);
    }
    refreshView();
  }

  List<ProductDto> productRes = [];

  Future<void> getProducts(String productId) async {
    products = UIState.loading();
    refreshView();
    final resEither = await ApiRequest.request(apiCall: () => _apiService.getSelectedProducts(productId));
    resEither.fold(
      (failure) => UIState.error(failure),
      (data) {
        productRes.add(data);

        products = UIState.success(productRes);
      },
    );
  }
}
