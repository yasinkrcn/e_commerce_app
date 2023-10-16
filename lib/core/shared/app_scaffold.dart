import 'package:e_commerce_app/core/_core_exports.dart';

class AppScaffold<T extends BaseController> extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final Drawer? drawer;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const AppScaffold({
    Key? key,
    this.appBar,
    this.backgroundColor = AppColors.white,
    this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomSheet,
    this.drawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Container(
            color: backgroundColor,
            padding: EdgeInsets.only(
              bottom: ScreenSize().bottomMargin,
            ),
            child: Scaffold(
              backgroundColor: backgroundColor,
              appBar: appBar ??
                  AppBar(
                    toolbarHeight: 0,
                    backgroundColor: backgroundColor,
                    elevation: 0,
                  ),
              body: body,
              drawer: drawer,
              bottomNavigationBar: bottomNavigationBar,
              floatingActionButton: floatingActionButton,
              floatingActionButtonLocation:
                  floatingActionButtonLocation ?? FloatingActionButtonLocation.miniCenterFloat,
              bottomSheet: bottomSheet,
            ),
          ),
          Selector<T, bool>(
            selector: (_, provider) => provider.isLoading,
            builder: (context, isLoading, child) {
              return Visibility(
                visible: isLoading,
                child: Stack(
                  children: [
                    ModalBarrier(dismissible: false, color: AppColors.black.withOpacity(.7)),
                    const Center(
                      //TODO:Eklenecek olan default gif, apilere istek gönderilen (sonuç beklenirken kullanıcının göreceği) ekranda çıkacak...
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
