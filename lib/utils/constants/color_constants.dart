import 'package:flutter/material.dart';

/// A centralized class for managing app colors.
class AppColors {
  // Primary Color
  static const Color primary = Color(0xFF1757FF);

  // Secondary Colors
  static const Color secondary = Color(0xFF050C9C);

  // Accent Colors
  static const Color accent = Color(0xFF857CCE);

  // Neutral Colors (Background and Text)
  static const Color backgroundLight = Color(0xFFFBFBFB);
  static const Color backgroundDark = Color(0xFF252525);

  static const Color textLight = Color(0xFFFBFBFB);
  static const Color textDark = Color(0xFF212427);
  static const Color textGrey = Color(0xFF212427);

  // Supporting Colors
  static const Color error = Color(0xFFFF2929);
  static const Color success = Color(0xFF06D001);
  static const Color greyDisabled = Color(0xFFB4B4B8);

  // Gradients
  /// Primary gradient used across the app.
  static const List<Color> gradientPrimary = [secondary, primary];
  static const List<double> gradientPrimaryStops = [0.35, 0.75];
}
