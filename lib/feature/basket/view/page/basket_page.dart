import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/feature/basket/controller/basket_controller.dart';
import 'package:e_commerce_app/feature/basket/view/widgets/basket_card.dart';
import 'package:lottie/lottie.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        backgroundColor: AppColors.lightGrey6,
        body: Consumer(
          builder: (context, BasketController controller, child) {
            return Column(
              children: [
                Expanded(
                  child: controller.basketList.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(AssetPaths().emptyBasketJSON),
                            AppText(
                              "There are no items in your basket",
                              style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
                            ),
                          ],
                        )
                      : ListView.builder(
                          itemCount: controller.basketList.length,
                          itemBuilder: (context, index) {
                            var basket = controller.basketList[index];
                            return BasketProductCard(
                              product: basket,
                            );
                          },
                        ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration:
                      BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.grey.shade300))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        "\$${controller.calculateProductPrice()}",
                        style: const TextStyle(fontSize: 24),
                      ),
                      AppButton.standart(
                        isActive: controller.basketList.isNotEmpty,
                        onTap: () {},
                        buttonText: "Continue",
                        height: 48,
                        width: 150.w,
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
