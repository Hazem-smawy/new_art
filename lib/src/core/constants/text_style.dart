library;

import 'package:flutter/material.dart';
import 'package:newart/src/core/constants/colors.dart';

//
class AppTextStyle {
  static const String fontFamily = 'Hacen';

  static TextStyle get displayLarge => const TextStyle(
        fontSize: 24,
        color: AppColors.blackColor,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily,
      );
  static TextStyle get displayMedium => const TextStyle(
        fontSize: 18,
        color: AppColors.blackColor,
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
      );
  static TextStyle get displaySmall => const TextStyle(
        fontSize: 17,
        fontFamily: fontFamily,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w100,
      );
  static TextStyle get titleLarge => const TextStyle(
        fontSize: 17,
        color: AppColors.blackColor,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w100,

        // fontWeight: FontWeight.bold,
      );
  static TextStyle get titleMedium => const TextStyle(
        fontSize: 16,
        fontFamily: fontFamily,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w100,
      );
  static TextStyle get titleSmall => const TextStyle(
        fontSize: 15,
        fontFamily: fontFamily,
        color: AppColors.secondaryTextColor,
        fontWeight: FontWeight.w100,
      );
  static TextStyle get bodyLarge => const TextStyle(
        fontSize: 13,
        fontFamily: fontFamily,
        color: AppColors.secondaryTextColor,
        fontWeight: FontWeight.w100,

        // fontWeight: FontWeight.bold,
      );
  static TextStyle get bodyMedium => const TextStyle(
        fontSize: 12,
        fontFamily: fontFamily,
        color: AppColors.secondaryTextColor,
        fontWeight: FontWeight.w100,
      );
  static TextStyle get bodySmall => const TextStyle(
        fontSize: 11,
        fontFamily: fontFamily,
        color: AppColors.secondaryTextColor,
        fontWeight: FontWeight.w100,
      );
}
