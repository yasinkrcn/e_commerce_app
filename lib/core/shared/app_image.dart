import '../_core_exports.dart';

class AppImage extends StatelessWidget {
  final String imageUrl;
  final double? size;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? borderWidth;

  final void Function()? onTap;
  late final ProfileImageType _profileImageType;

  AppImage._({
    Key? key,
    required this.imageUrl,
    this.size,
    this.height,
    this.width,
    this.borderRadius,
    this.borderWidth,
    this.onTap,
    required ProfileImageType profileImageType,
  }) : super(key: key) {
    _profileImageType = profileImageType;
  }

  factory AppImage.circle({
    required String imageUrl,
    double? size,
    void Function()? onTap,
    double? borderRadius,
    double? borderWidth,
  }) {
    return AppImage._(
      onTap: onTap,
      imageUrl: imageUrl,
      size: size,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      profileImageType: ProfileImageType.circle,
    );
  }
  factory AppImage.custom({
    required String imageUrl,
    double? height,
    double? width,
    double? borderWidth,
    double? borderRadius = 0,
    void Function()? onTap,
    Widget? child,
  }) {
    return AppImage._(
      onTap: onTap,
      imageUrl: imageUrl,
      height: height,
      width: width,
      borderWidth: borderWidth ?? 2,
      borderRadius: borderRadius ?? 0,
      profileImageType: ProfileImageType.custom,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (_profileImageType) {
      case ProfileImageType.circle:
        return GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: size ?? 36,
            width: size ?? 36,
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: imageUrl,
                placeholder: (context, url) {
                  return const AppLoadingWidget();
                },
                errorWidget: (context, url, error) {
                  return const AppErrorWidget();
                },
              ),
            ),
          ),
        );
      case ProfileImageType.custom:
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular((borderRadius! - borderWidth!)),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: imageUrl,
                placeholder: (context, url) {
                  return const AppLoadingWidget();
                },
                errorWidget: (context, url, error) {
                  return const AppErrorWidget();
                },
              ),
            ),
          ),
        );
    }
  }
}

enum ProfileImageType {
  circle,
  custom,
}
