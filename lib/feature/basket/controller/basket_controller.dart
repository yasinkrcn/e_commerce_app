import 'package:e_commerce_app/core/_core_exports.dart';

class BasketController extends BaseController {
  List<ProductDto> basketList = [];
  void addBasketProduct(ProductDto product) {
    basketList.add(product);

    showCustomMessenger(CustomMessengerState.INFO, "Product added to basket");
  }

  void removeBasketProduct(ProductDto product) {
    basketList.remove(product);

    refreshView();
  }

  double calculateProductPrice() {
    double price = 0;
    if (basketList.isNotEmpty) {
      for (var element in basketList) {
        price = price + element.price;
      }
    }

    return price;
  }
}
