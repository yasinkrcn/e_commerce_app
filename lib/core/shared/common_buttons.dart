import '../_core_exports.dart';

class CommonButtons extends StatelessWidget {
  final String? icon;
  final double? iconSize;
  final double? size = 56.w;

  final void Function()? onTap;

  CommonButtons._({
    this.icon,
    this.onTap,
    this.iconSize,
  });

  factory CommonButtons.menu({
    String? icon,
    void Function()? onTap,
  }) {
    String icon = AssetPaths().menuIconSVG;
    return CommonButtons._(
      onTap: onTap,
      icon: icon,
    );
  }

  factory CommonButtons.close({
    String? icon,
    void Function()? onTap,
  }) {
    String icon = AssetPaths().closeIconSVG;
    return CommonButtons._(
      onTap: onTap,
      icon: icon,
    );
  }
  factory CommonButtons.back({
    String? icon,
    void Function()? onTap,
    double? iconSize,
  }) {
    String icon = AssetPaths().backIconSVG;
    double iconSize = 30.w;
    return CommonButtons._(
      onTap: onTap,
      icon: icon,
      iconSize: iconSize,
    );
  }
  factory CommonButtons.notification({
    String? icon,
    void Function()? onTap,
  }) {
    String icon = AssetPaths().notificationIconSVG;

    return CommonButtons._(
      onTap: onTap,
      icon: icon,
    );
  }
  factory CommonButtons.notificationAvailable({
    String? icon,
    void Function()? onTap,
  }) {
    String icon = AssetPaths().notificationAvailableIconSVG;
    return CommonButtons._(
      onTap: onTap,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(width: 0.50, color: const Color(0xFFE6E6E6)),
        ),
        child: SizedBox(
          height: iconSize ?? 24.w,
          width: iconSize ?? 24.w,
          child: SvgPicture.asset(icon!),
        ),
      ),
    );
  }
}
