import 'package:flutter/material.dart';
import 'package:valorant_universe_remastered/app/theme/app_colors.dart';

final class AppTheme {
  final ThemeData theme = ThemeData.dark().copyWith(
    typography: Typography.material2021(),
    scaffoldBackgroundColor: AppColors.black,
    focusColor: AppColors.red,
    disabledColor: AppColors.grey,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.tranparent,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
      selectedItemColor: AppColors.red,
      unselectedItemColor: AppColors.grey,
    ),
  );
}
