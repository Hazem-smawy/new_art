import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

// extension BuildContextEntension<T> on BuildContext {
//   bool get de => MediaQuery.of(this).size.width <= 500.0;

//   bool get sm =>
//       MediaQuery.of(this).size.width < 768.0 &&
//       MediaQuery.of(this).size.width >= 500.0;

//   bool get md =>
//       MediaQuery.of(this).size.width < 1024.0 &&
//       MediaQuery.of(this).size.width > 768.0;

//   bool get lg => MediaQuery.of(this).size.width >= 1024.0;

//   bool get isSmall => MediaQuery.of(this).size.width < 850.0;

//   // double get width => MediaQuery.of(this).size.width;

//   // double get height => MediaQuery.of(this).size.height;

//   Size get size => MediaQuery.of(this).size;

//   // text styles

//   TextStyle? get displayLarge => AppTextStyle.displayLarge;

//   TextStyle? get displayMeduim => AppTextStyle.displayMedium;

//   TextStyle? get displaySmall => AppTextStyle.displaySmall;

//   TextStyle? get titleLarge => AppTextStyle.titleLarge;

//   TextStyle? get titleMedium => AppTextStyle.titleMedium;

//   TextStyle? get titleSmall => AppTextStyle.titleSmall;

//   TextStyle? get bodySmall => AppTextStyle.bodySmall;

//   TextStyle? get bodyMeduim => AppTextStyle.bodyMedium;

//   TextStyle? get bodyLarge => AppTextStyle.bodyLarge;

//   // colors

//   Color get primaryColor => Theme.of(this).primaryColor;
//   Color get bg => Theme.of(this).canvasColor;

//   Color get primaryColorDark => Theme.of(this).primaryColorDark;

//   Color get primaryColorLight => Theme.of(this).primaryColorLight;

//   Color get primary => Theme.of(this).colorScheme.primary;

//   Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

//   Color get secondary => Theme.of(this).colorScheme.secondary;

//   Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

//   Color get cardColor => Theme.of(this).cardColor;

//   Color get errorColor => Theme.of(this).colorScheme.error;

//   Color get surfaceColor => Theme.of(this).colorScheme.surface;
//   Color get containerColor => AppColors.containerColor;
//   Color get secondaryTextColor => AppColors.secondaryTextColor;
//   Color get wightColor => Colors.white;

//   Color get blackColor => Colors.black;

//   //gaps
//   Widget get g4 => SizedBox(
//         width: 4.w,
//         height: 4.h,
//       );
//   Widget get g8 => SizedBox(
//         width: 8.w,
//         height: 8.h,
//       );

//   Widget get g12 => SizedBox(
//         width: 12.w,
//         height: 12.h,
//       );

//   Widget get g16 => SizedBox(
//         width: 16.w,
//         height: 16.h,
//       );

//   Widget get g20 => SizedBox(
//         width: 20.w,
//         height: 20.h,
//       );
//   Widget get g28 => SizedBox(
//         width: 28.w,
//         height: 28.h,
//       );
//   Widget get g36 => SizedBox(
//         width: 36.w,
//         height: 36.h,
//       );
//   Widget get g44 => SizedBox(
//         width: 44.w,
//         height: 44.h,
//       );
//   Widget get g56 => SizedBox(
//         width: 56.w,
//         height: 56.h,
//       );

//   //spaces
//   double get sp4 => 4;
//   double get sp8 => 8;
//   double get sp12 => 12;
//   double get sp16 => 16;
//   double get sp20 => 20;
//   double get sp28 => 28;
// }
// import 'package:new_art/src/core/constants/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../constants/text_style.dart';

// Define screen breakpoints as constants
const double smallWidth = 500.0;
const double mediumWidth = 768.0;
const double largeWidth = 1024.0;

extension BuildContextExtension on BuildContext {
  // Screen size categories
  bool get isExtraSmall => size.width <= smallWidth;
  bool get isSmall => size.width > smallWidth && size.width < mediumWidth;
  bool get isMedium => size.width >= mediumWidth && size.width < largeWidth;
  bool get isLarge => size.width >= largeWidth;

  // Screen dimensions
  Size get size => MediaQuery.of(this).size;

  // Text styles with fallback values
  TextStyle get displayLarge => AppTextStyle.displayLarge;
  TextStyle get displayMedium => AppTextStyle.displayMedium;
  TextStyle get displaySmall => AppTextStyle.displaySmall;

  TextStyle get titleLarge => AppTextStyle.titleLarge;
  TextStyle get titleMedium => AppTextStyle.titleMedium;
  TextStyle get titleSmall => AppTextStyle.titleSmall;

  TextStyle get bodyLarge => AppTextStyle.bodyLarge;
  TextStyle get bodyMedium => AppTextStyle.bodyMedium;
  TextStyle get bodySmall => AppTextStyle.bodySmall;

  // Theme-based colors with defaults
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get backgroundColor => Theme.of(this).canvasColor;
  Color get primaryColorDark => Theme.of(this).primaryColorDark;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primary => Theme.of(this).colorScheme.primary;
  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;
  Color get secondary => Theme.of(this).colorScheme.secondary;
  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;
  Color get cardColor => Theme.of(this).cardColor;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;

  // App-specific colors
  Color get containerColor => AppColors.containerColor;
  Color get secondaryTextColor => AppColors.secondaryTextColor;
  Color get whiteColor => Colors.white;
  Color get blackColor => Colors.black;
  Color get goldenColor => AppColors.goldenTextColor;

  // Gaps for spacing
  Widget gap(double width, double height) =>
      SizedBox(width: width, height: height);

  Widget get g4 => gap(4, 4);
  Widget get g8 => gap(8, 8);
  Widget get g12 => gap(12, 12);
  Widget get g16 => gap(16, 16);
  Widget get g20 => gap(20, 20);
  Widget get g28 => gap(28, 28);
  Widget get g36 => gap(36, 36);
  Widget get g44 => gap(44, 44);
  Widget get g56 => gap(56, 56);

  // Simple spacing values
  double get sp4 => 4;
  double get sp8 => 8;
  double get sp12 => 12;
  double get sp16 => 16;
  double get sp20 => 20;
  double get sp28 => 28;
}
