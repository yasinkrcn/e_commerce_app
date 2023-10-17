import 'dart:convert';

import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/feature/favorites/data/service/favorite_service.dart';

class FavoriteController extends BaseController {
  final SecureStorageManager _secureStorageManager;
  final FavoriteService _apiService;

  FavoriteController(this._secureStorageManager, this._apiService) {
    readProductToLocal();
  }

  List<String> saveProductList = [];
  List<String> readProductList = [];

  Future<void> saveProductToLocal(String productId) async {
    try {
      await readProductToLocal();

      if (!saveProductList.any((element) => element == productId)) {
        saveProductList.add(productId);

        final listAsString = saveProductList.join(';');

        await _secureStorageManager.write(SecureStorageKeys.FAVORITES_INFO, listAsString);

        await readProductToLocal();

        showCustomMessenger(CustomMessengerState.SUCCESS, "Favorilere eklendi");
      } else {
        showCustomMessenger(CustomMessengerState.WARNING, "Ürün zaten favorilerde");
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
      readProductList = res.split(';'); // Ayraçı kullanarak listeyi böler
      saveProductList.clear();
      saveProductList = readProductList;
      return readProductList;
    } else {
      return [];
    }
  }

  Future<void> deleteProductToLocal() async {}

  // Products

  UIState<List<ProductDto>> products = UIState.idle();

  Future<void> fetchProducts() async {
    if (productRes.isNotEmpty) {
      products.data.clear();
    }

    productRes.clear();
    await readProductToLocal();
    for (var element in readProductList) {
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
