import 'package:flutter/material.dart';

/// Default viewport values from your design tool (Figma, Adobe XD, etc.).
class DesignBaseline {
  static num width = 360; // Default design width
  static num height = 800; // Default design height
  static num statusBarHeight = 0; // Default status bar height
}

/// Utility to update the design baseline dynamically.
class ResponsiveConfig {
  static void updateDesignBaseline({
    required num width,
    required num height,
    num statusBarHeight = 0,
  }) {
    DesignBaseline.width = width;
    DesignBaseline.height = height;
    DesignBaseline.statusBarHeight = statusBarHeight;
  }
}

/// Extension to make UI responsive across all mobile devices.
extension ResponsiveExtension on num {
  /// Get device viewport width.
  double _getViewportWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  /// Get device viewport height.
  double _getViewportHeight(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    num statusBar = mediaQuery.viewPadding.top;
    num bottomBar = mediaQuery.viewPadding.bottom;
    num usableHeight = mediaQuery.size.height - statusBar - bottomBar;
    return usableHeight.toDouble();
  }

  /// Calculate width proportionally to the design baseline width.
  double w(BuildContext context) {
    return (this * _getViewportWidth(context)) / DesignBaseline.width;
  }

  /// Calculate height proportionally to the design baseline height.
  double h(BuildContext context) {
    return (this * _getViewportHeight(context)) /
        (DesignBaseline.height - DesignBaseline.statusBarHeight);
  }

  /// Set the smallest proportional size for square dimensions (e.g., icons, images).
  double adaptSize(BuildContext context) {
    final proportionalHeight = h(context);
    final proportionalWidth = w(context);
    return proportionalHeight < proportionalWidth
        ? proportionalHeight
        : proportionalWidth;
  }

  /// Set text font size proportionally, factoring in the device's text scale factor.
  double fSize(BuildContext context) {
    final textScaler = MediaQuery.textScalerOf(context);
    return adaptSize(context) * textScaler.scale((.8));
  }
}

/// Extension for formatting double values.
extension FormatExtension on double {
  /// Return a [double] value formatted to the specified number of fraction digits.
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }
}
