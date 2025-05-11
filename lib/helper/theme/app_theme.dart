import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';


class AppTheme {
  static const Color primaryWhite = Colors.white;
  static const Color primaryGrey = Color(0xFF9E9E9E);

  static final ThemeData theme = ThemeData(
    primaryColor: primaryWhite,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: primaryWhite,
      secondary: primaryGrey,
    ),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        titleTextStyle: AppTextStyles.titleStyle
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryWhite),
      ),
      labelStyle: TextStyle(color: primaryGrey),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryWhite,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
