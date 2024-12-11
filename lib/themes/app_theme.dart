import 'package:flutter/material.dart';
import 'package:flutter_project_template/utils/constants/color_constants.dart';

/// Defines App Theme Data
ThemeData theme({bool isDarkMode = false}) {
  // Light and dark color schemes
  ColorScheme colorScheme = isDarkMode
      ? const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.backgroundDark,
          onSurface: AppColors.textLight,
        )
      : const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.backgroundLight,
          onSurface: AppColors.textDark,
        );

  // Returning the theme with the appropriate configurations
  return ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    fontFamily: "Poppins",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    unselectedWidgetColor: AppColors.greyDisabled,
    colorScheme: colorScheme,
  );
}
