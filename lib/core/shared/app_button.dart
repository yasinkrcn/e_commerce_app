import 'package:e_commerce_app/core/_core_exports.dart';

class AppButton extends StatelessWidget {
  final String? buttonText;
  final Color backGroundColor;
  final TextStyle? style;

  final String? iconPath;
  final double? width;
  final double? height;
  late final BoxBorder? _border;
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final double? iconWidth;
  final double? iconHeight;
  final Color? textColor;

  AppButton._({
    Key? key,
    this.onTap,
    this.iconPath,
    BoxBorder? border,
    this.width,
    this.style,
    this.height = 56,
    required this.buttonText,
    required this.backGroundColor,
    this.textColor,
    this.borderRadius,
    this.boxShadow,
    this.left,
    this.right,
    this.top,
    this.bottom,
    this.iconWidth,
    this.iconHeight,
  }) : super(key: key) {
    _border = border;
  }

  factory AppButton.standart({
    required Function() onTap,
    required String buttonText,
    bool isActive = true,
    color,
    BorderRadiusGeometry? borderRadius,
    Color? textColor,
    double? width,
    double? height,
  }) {
    Color backgroundColor = AppColors.mainPrimary;
    Color textColor = Colors.white;

    if (!isActive) {
      backgroundColor = AppColors.mainSecondary;
      textColor = AppColors.mainPrimary;
    }

    return AppButton._(
      onTap: onTap,
      buttonText: buttonText,
      backGroundColor: color ?? backgroundColor,
      textColor: textColor,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      width: width,
      height: height,
    );
  }

  factory AppButton.icon({
    required Function() onTap,
    required String iconPath,
    String? buttonText,
    Color? textColor,
    Color? backGroundColor,
    bool isActive = true,
    double? width,
    double? top,
    double? bottom,
    List<BoxShadow>? boxShadow,
    double? height,
    style,
    double? iconWidth,
    double? iconHeight,
  }) {
    Color incomingBackgroundColor = backGroundColor ?? AppColors.white;

    Color incomingTextColor = textColor ?? AppColors.black;

    boxShadow = [
      BoxShadow(
        color: const Color(0xFFD9D9D9).withOpacity(.65),
        blurRadius: 20,
        blurStyle: BlurStyle.outer,
      ),
    ];

    if (!isActive) {
      incomingTextColor = incomingTextColor.withOpacity(.25);
      incomingBackgroundColor = incomingBackgroundColor.withOpacity(.25);
    }

    return AppButton._(
      onTap: onTap,
      iconPath: iconPath,
      buttonText: buttonText,
      textColor: incomingTextColor,
      backGroundColor: incomingBackgroundColor,
      width: width,
      boxShadow: boxShadow,
      top: top,
      bottom: bottom,
      height: height,
      style: style,
      iconWidth: iconWidth,
      iconHeight: iconHeight,
    );
  }

  factory AppButton.outline({
    Function()? onTap,
    String? buttonText,
    Color? textColor,
    Color? borderColor,
    Color? backGroundColor,
    bool isActive = true,
    double? width,
    double? height,
    style,
  }) {
    Color incomingBackgroundColor = backGroundColor ?? AppColors.white;
    Color incomingBorderColor = borderColor ?? AppColors.mainPrimary;
    Color incomingTextColor = textColor ?? AppColors.mainPrimary;

    if (!isActive) {
      incomingBorderColor = AppColors.mainPrimary.withOpacity(.6);
      incomingTextColor = AppColors.mainPrimary.withOpacity(.6);
      incomingBackgroundColor = AppColors.white;
    }

    return AppButton._(
      onTap: onTap,
      buttonText: buttonText,
      textColor: incomingTextColor,
      backGroundColor: incomingBackgroundColor,
      border: Border.all(color: incomingBorderColor),
      height: height,
      width: width,
      style: style,
    );
  }

  factory AppButton.small({
    Function()? onTap,
    String? iconPath,
    String? buttonText,
    Color? textColor,
    Color? backGroundColor,
    bool isActive = true,
    double? width,
    double? height,
    borderRadius,
    style,
  }) {
    Color incomingBackgroundColor = backGroundColor ?? AppColors.mainPrimary;
    Color incomingTextColor = textColor ?? AppColors.white;

    if (!isActive) {
      print(isActive);
      incomingTextColor = AppColors.darkGrey2;
      incomingBackgroundColor = AppColors.darkGrey2;
    }

    return AppButton._(
      onTap: onTap,
      buttonText: buttonText,
      textColor: incomingTextColor,
      backGroundColor: incomingBackgroundColor,
      width: width ?? 130.w,
      height: height,
      iconPath: iconPath,
      borderRadius: borderRadius ?? BorderRadius.circular(10.r),
      style: style,
    );
  }
  factory AppButton.smallOutline({
    required Function() onTap,
    String? iconPath,
    String? buttonText,
    Color? textColor,
    Color? borderColor,
    Color? backGroundColor,
    bool isActive = true,
    double? width,
    double? height,
  }) {
    Color incomingBackgroundColor = backGroundColor ?? AppColors.white;
    Color incomingBorderColor = borderColor ?? AppColors.mainPrimary;
    Color incomingTextColor = textColor ?? AppColors.mainPrimary;

    if (!isActive) {
      incomingBorderColor = incomingBorderColor.withOpacity(.25);
      incomingTextColor = incomingTextColor.withOpacity(.25);
      incomingBackgroundColor = incomingBackgroundColor.withOpacity(.25);
    }

    return AppButton._(
      onTap: onTap,
      buttonText: buttonText,
      textColor: incomingTextColor,
      backGroundColor: incomingBackgroundColor,
      border: Border.all(color: incomingBorderColor),
      width: 148,
      height: height,
      iconPath: iconPath,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? 0,
        right: right ?? 0,
        top: top ?? 0,
        bottom: bottom ?? 0,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height ?? 56.h,
          alignment: Alignment.center,
          width: width,
          decoration: BoxDecoration(
            border: _border,
            color: backGroundColor,
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            boxShadow: boxShadow,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPath != null) ...[
                Image.asset(
                  iconPath ?? '',

                  height: iconHeight ?? 36,
                  // color: _iconColor,
                ),
                8.width
              ],
              if (buttonText != null) ...[
                AppText(buttonText ?? "",
                    style: style ?? AppTextStyles.buttonMedium16.getTextStyle.copyWith(color: textColor)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
