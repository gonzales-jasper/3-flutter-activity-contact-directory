import 'package:flutter/material.dart';

class AppColors {
  // Background
  static const Color cardAccent = Color(0xFF283847);
  static const Color scaffoldBackground = Color(0xFF132533);
  static const Color cardBackground = Color(0xFF20313F);

  // Primary Colors for Buttons
  static const Color primaryColor = Color(0xFF1F83FF);
  static const Color primaryAccent = Color(0xFF0065DD);
  static const Color secondaryColor = Colors.amber;

  // Text
  static const Color titleColor = Color(0xFFFFFFFF);
  static const Color textColor = Color(0xFFC1B7B7);
}

ThemeData theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: AppColors.primaryColor,
    surface: AppColors.cardBackground,
    onSurface: AppColors.titleColor,
    onSurfaceVariant: AppColors.textColor,
  ),

  //appbar
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.cardBackground,
    foregroundColor: AppColors.textColor,
    elevation: 0,
    centerTitle: true,
  ),

  //Scaffold
  scaffoldBackgroundColor: AppColors.scaffoldBackground,

  //Text
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.textColor,
      fontSize: 16,
      letterSpacing: 1,
    ),
    headlineMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
    titleMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
    titleLarge: TextStyle(
      color: AppColors.titleColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
  ),
);
