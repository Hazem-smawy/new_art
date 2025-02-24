import 'package:newart/src/core/constants/colors.dart';
import 'package:newart/src/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class AppThemData {
  static ThemeData lightThemeData = themeData(lightColorScheme);

  static ThemeData darkThemeData = themeData(lightColorScheme);
  static ThemeData themeData(
    ColorScheme colorScheme,
  ) {
    return ThemeData.from(colorScheme: colorScheme).copyWith(
      colorScheme: colorScheme,
      canvasColor: AppColors.bg,
      scaffoldBackgroundColor: AppColors.bg,
      highlightColor: Colors.transparent,
      focusColor: colorScheme.primary,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.secondaryTextColor.withAlpha(50),
            width: 0,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: BorderSide(
            color: AppColors.secondaryTextColor.withAlpha(50),
            width: 0,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyle.displayLarge,
        displayMedium: AppTextStyle.displayMedium,
        displaySmall: AppTextStyle.displaySmall,
        titleLarge: AppTextStyle.titleLarge,
        titleMedium: AppTextStyle.titleMedium,
        titleSmall: AppTextStyle.titleSmall,
        bodyLarge: AppTextStyle.bodyLarge,
        bodySmall: AppTextStyle.bodySmall,
        bodyMedium: AppTextStyle.bodyMedium,
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.white,
    error: Colors.redAccent,
    onError: Colors.white,
    surface: AppColors.sheetBgColor,
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );
}
