import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF006C4C);
  static const Color primaryDark = Color(0xFF004D35);
  static const Color accent = Color(0xFFD4AF37);
  static const Color backgroundLight = Color(0xFFF7F9F6);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceLight = Colors.white;
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color textPrimaryLight = Color(0xFF2D3142);
  static const Color textPrimaryDark = Color(0xFFE2E8F0);
}

class AppTheme {
  static const Color primaryColor = AppColors.primary;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ),
    );
  }
}
