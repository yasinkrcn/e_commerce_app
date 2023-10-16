import 'package:e_commerce_app/core/_core_exports.dart';

import 'package:e_commerce_app/core/shared/app_tab_controller/utils/sliver_app_bar_delegate.dart';

class AppTabController extends StatelessWidget {
  const AppTabController({
    super.key,
    required this.minTabHeight,
    required this.maxTabHeight,
    required this.tabs,
    required this.tabViews,
    this.pinned = false,
    this.tabbarBackgroundColor,
  }) : assert(tabViews.length == tabs.length);

  final double minTabHeight;

  final double maxTabHeight;

  final List<Widget> tabs;

  final List<Widget> tabViews;

  final bool pinned;

  final Color? tabbarBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, index) => [
          SliverPersistentHeader(
            pinned: pinned,
            delegate: SliverAppBarDelegate(
              minHeight: minTabHeight,
              maxHeight: maxTabHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: tabbarBackgroundColor ?? AppColors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.lightGrey3,
                      width: 1.h,
                    ),
                  ),
                ),
                child: TabBar(
                  indicatorColor: AppColors.mainPrimary,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 2,
                  labelColor: AppColors.mainPrimary,
                  unselectedLabelColor: AppColors.lightGrey3,
                  labelStyle: AppTextStyles.buttonMedium16.getTextStyle,
                  unselectedLabelStyle: AppTextStyles.buttonMedium16.getTextStyle,
                  labelPadding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: tabs,
                ),
              ),
            ),
          ),
        ],
        body: Container(
          color: AppColors.backgroundColor,
          child: TabBarView(
            children: tabViews,
          ),
        ),
      ),
    );
  }
}
