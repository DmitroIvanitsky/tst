import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.grey,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.white,
      background: AppColors.grey
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 25.0,
      ),
      displayMedium: TextStyle(
        fontSize: 18.0,
      ),
    ),
  );
}