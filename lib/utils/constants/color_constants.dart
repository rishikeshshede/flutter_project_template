import 'package:flutter/material.dart';

/// A centralized class for managing app colors.
class AppColors {
  // Primary Colors
  static const Color primaryDark = Color(0xFF03045E);
  static const Color primary = Color(0xFF0077B6);
  static const Color primaryLight = Color(0xFF00B4D8);

  // Secondary & Accent Colors
  static const Color secondary = Color(0xFF48CAE4);
  static const Color accent = Color(0xFFADE8F4);

  // Background and Surface Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color disabled = Color(0xFFEEEEEE);

  // Text Colors
  static const Color textPrimary = Color(0xFF001D3D);
  static const Color textSecondary = Color(0xFF657D88);

  // Highlight Colors
  static const Color red = Color(0xFFDE3939);
  static const Color green = Color(0xFF1FB453);
  static const Color black = Color(0xFF0F0F0F);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF98A2B3);

  // Gradients
  /// Primary gradient used across the app.
  static const List<Color> gradientPrimary = [
    primaryLight,
    primary,
    primaryDark,
  ];
  static const List<double> gradientPrimaryStops = [0.25, 0.5, 0.75];
}
