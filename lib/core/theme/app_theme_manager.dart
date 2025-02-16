import 'package:flutter/material.dart';
import 'package:evently_app/core/theme/app_colors.dart';

abstract class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkThemeBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
}
