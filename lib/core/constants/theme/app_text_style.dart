import 'package:e_commerce_app/core/_core_exports.dart';
import 'package:e_commerce_app/core/constants/theme/app_fonts.dart';

enum AppTextStyles {
  // Headline
  headlineLargeBold,
  headlineMedium,
  headlineBold,
  h1Bold,
  h1Regular,
  h2Medium,
  h3Medium,
  h4Medium,
  h5Medium,
  h5MediumW400,
  h5Regular,
  headlineSemibold24,
  headlineSemibold16,
  headlineSemibold12,

  // Buttons
  buttonLargeMedium,
  buttonMedium16,
  buttonSmallMedium,

  // Body
  bodyTextMedium,
  bodyMediumRegular,
  bodySmallMedium,
  bodySmallerRegular,
  bodySmallerSemiBold,

  // Label
  labelLargeBold,
  labelMainRegular,
  labelRegular,
  labelSmallRegular,

  extraMedium,
  montserrat12Semiboldw600,
  montserrat12Boldw600,
  montserrat12Regularw400,
  montserrat12Mediumw500,
}

extension AppTextStylesExtension on AppTextStyles {
  TextStyle get getTextStyle {
    switch (this) {
      case AppTextStyles.headlineLargeBold:
        return TextStyle(
          fontSize: 40.sp,
          height: 1.2,
          letterSpacing: -1.1,
          fontFamily: AppFonts.montserratBold,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        );
      case AppTextStyles.headlineMedium:
        return TextStyle(
          fontSize: 22.sp,
          height: 1.2,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.montserratMedium,
        );
      case AppTextStyles.headlineBold:
        return TextStyle(
          fontSize: 22.sp,
          height: 1.2,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
          fontFamily: AppFonts.montserratBold,
        );
      case AppTextStyles.h1Bold:
        return TextStyle(
          fontSize: 20.sp,
          height: 1.2,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
          fontFamily: AppFonts.montserratBold,
        );
      case AppTextStyles.h1Regular:
        return TextStyle(
          fontSize: 20.sp,
          height: 1.25,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.montserratRegular,
        );
      case AppTextStyles.h2Medium:
        return TextStyle(
          fontSize: 17.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.montserratMedium,
        );
      case AppTextStyles.h3Medium:
        return TextStyle(
          fontSize: 15.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.montserratMedium,
        );
      case AppTextStyles.h4Medium:
        return TextStyle(
          fontSize: 14.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.montserratMedium,
        );
      case AppTextStyles.h5Medium:
        return TextStyle(
          fontSize: 13.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.montserratMedium,
        );
      case AppTextStyles.h5MediumW400:
        return TextStyle(
          fontSize: 13.sp,
          height: 1.3,
          color: AppColors.black,
          fontFamily: AppFonts.montserratMedium,
          fontWeight: FontWeight.w400,
        );

      case AppTextStyles.h5Regular:
        return TextStyle(
          fontSize: 13.sp,
          height: 1.3,
          color: AppColors.black,
          fontFamily: AppFonts.montserratRegular,
          fontWeight: FontWeight.w400,
        );

      case AppTextStyles.headlineSemibold24:
        return TextStyle(
          fontSize: 24.sp,
          height: 1.33,
          color: AppColors.black,
          fontFamily: AppFonts.montserratSemiBold,
          fontWeight: FontWeight.w600,
        );
      case AppTextStyles.headlineSemibold16:
        return TextStyle(
          fontSize: 16.sp,
          height: 1.21,
          color: AppColors.black,
          fontFamily: AppFonts.montserratSemiBold,
          fontWeight: FontWeight.w600,
        );
      case AppTextStyles.headlineSemibold12:
        return TextStyle(
          fontSize: 12.sp,
          height: 1.21,
          color: AppColors.black,
          fontFamily: AppFonts.montserratSemiBold,
          fontWeight: FontWeight.w600,
        );
      case AppTextStyles.buttonLargeMedium:
        return TextStyle(
          fontSize: 18.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.montserratMedium,
        );
      case AppTextStyles.buttonMedium16:
        return TextStyle(
          fontSize: 16.sp,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.montserratSemiBold,
        );
      case AppTextStyles.buttonSmallMedium:
        return TextStyle(
          fontSize: 14.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.montserratMedium,
        );
      case AppTextStyles.bodyTextMedium:
        return TextStyle(
          fontSize: 18.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.montserratMedium,
        );
      case AppTextStyles.bodyMediumRegular:
        return TextStyle(
          fontSize: 16.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.montserratRegular,
        );
      case AppTextStyles.bodySmallMedium:
        return TextStyle(
          fontSize: 14.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.montserratMedium,
        );
      case AppTextStyles.bodySmallerRegular:
        return TextStyle(
          fontSize: 14.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.montserratRegular,
        );
      case AppTextStyles.bodySmallerSemiBold:
        return TextStyle(
          fontSize: 14.sp,
          height: 1.25,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.montserratSemiBold,
        );

      case AppTextStyles.labelLargeBold:
        return TextStyle(
          fontSize: 26.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
          fontFamily: AppFonts.montserratBold,
        );
      case AppTextStyles.labelMainRegular:
        return TextStyle(
          fontSize: 14.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.montserratRegular,
        );
      case AppTextStyles.labelRegular:
        return TextStyle(
          fontSize: 12.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.montserratRegular,
        );
      case AppTextStyles.labelSmallRegular:
        return TextStyle(
          fontSize: 8.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.montserratRegular,
        );

      case AppTextStyles.extraMedium:
        return TextStyle(
          fontSize: 34.sp,
          height: 1.3,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.montserratMedium,
        );
      case AppTextStyles.montserrat12Semiboldw600:
        return TextStyle(
          fontSize: 12.sp,
          height: 1.219,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.montserratSemiBold,
        );
      case AppTextStyles.montserrat12Boldw600:
        return TextStyle(
          fontSize: 12.sp,
          height: 1.219,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
          fontFamily: AppFonts.montserratBold,
        );
      case AppTextStyles.montserrat12Regularw400:
        return TextStyle(
          fontSize: 12.sp,
          height: 1.25,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.montserratRegular,
        );
      case AppTextStyles.montserrat12Mediumw500:
        return TextStyle(
          fontSize: 12.sp,
          height: 1.25,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.montserratMedium,
        );
    }
  }
}
