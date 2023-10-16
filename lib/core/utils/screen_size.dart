import 'package:e_commerce_app/core/_core_exports.dart';

class ScreenSize {
  static final ScreenSize _instance = ScreenSize._init();

  ScreenSize._init();

  factory ScreenSize() {
    _instance.screenSize = MediaQuery.of(GlobalContextKey.instance.globalKey.currentContext!).size;

    _instance.bottomMargin = MediaQuery.of(GlobalContextKey.instance.globalKey.currentContext!).padding.bottom;

    _instance.topMargin = MediaQuery.of(GlobalContextKey.instance.globalKey.currentContext!).padding.top;

    return _instance;
  }

  late Size screenSize;

  late double topMargin;

  late double bottomMargin;

  double getHeightPercent(double percent) {
    return screenSize.height * percent;
  }

  double getWidthPercent(double percent) {
    return screenSize.width * percent;
  }

  double getHeight(num heightNum) {
    double height = (screenSize.height * heightNum) / AppConstants().designDeviceSize.height;

    return height;
  }

  double getWidth(num widthNum) {
    double width = (screenSize.width * widthNum) / AppConstants().designDeviceSize.width;

    return width;
  }

  double bodyHeight() {
    double height = screenSize.height - topMargin - bottomMargin;

    return height;
  }

  double bodyHeightWithAppBar() {
    double height = screenSize.height - topMargin - bottomMargin - AppBar().preferredSize.height;

    return height;
  }

  double getSp(num fontSize) => fontSize * _scaleText;

  double radius(num r) {
    return r *
        min((screenSize.width / AppConstants().designDeviceSize.width),
            (screenSize.height / AppConstants().designDeviceSize.height));
  }

  double get sizeRatio => screenSize.aspectRatio / AppConstants().designDeviceSize.aspectRatio;

  double get _scaleText => min(_scaleWidth, _scaleHeight);

  double get _scaleWidth => screenSize.width / AppConstants().designDeviceSize.width;

  double get _scaleHeight => screenSize.height / AppConstants().designDeviceSize.height;
}
