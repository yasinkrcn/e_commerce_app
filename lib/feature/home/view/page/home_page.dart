import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/core/shared/app_widget_state_builder.dart';
import 'package:e_commerce_app/feature/home/controller/home_controller.dart';
import 'package:e_commerce_app/feature/home/view/widgets/products_tabbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Consumer(
        builder: (context, HomeController homeController, child) {
          return Column(
            children: [
              Expanded(
                child: AppWidgetBuilderByState.none(
                  response: homeController.categories,
                  builder: (categories) {
                    return AppTabController(
                      minTabHeight: 46.h,
                      maxTabHeight: 46.h,
                      tabbarBackgroundColor: AppColors.backgroundColor,
                      pinned: true,
                      tabs: List.generate(categories.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Tab(
                            text: categories[index],
                          ),
                        );
                      }),
                      tabViews: List.generate(categories.length, (index) {
                        return ProductsTabbar(
                          selectedCategory: categories[index],
                        );
                      }),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
