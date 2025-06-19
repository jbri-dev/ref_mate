import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.accent,
    primary: AppColors.accent,
    secondary: AppColors.secondary,
    surface: AppColors.background,
    onPrimary: Colors.white,
    onSecondary: AppColors.primaryText,
    onSurface: AppColors.primaryText,
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.primaryText),
    bodyMedium: TextStyle(color: AppColors.primaryText),
    bodySmall: TextStyle(color: AppColors.primaryText),
  ),
  cardColor: AppColors.cardBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.accent,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  useMaterial3: true,
);
