import 'package:flutter/material.dart';
import 'package:flutter_project_template/utils/constants/color_constants.dart';
import 'package:flutter_project_template/utils/constants/size_constants.dart';
import 'package:flutter_project_template/utils/responsive_util.dart';

/// Defines text themes for the app
class AppTextTheme {
  static double _getResponsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = ResponsiveUtil.width(context, 1);

    // Define breakpoints and corresponding font sizes
    if (screenWidth >= 600) {
      // Large screens
      return baseSize * 1.5;
    } else if (screenWidth >= 400) {
      // Medium-sized screens
      return baseSize * 1.2;
    } else {
      // Small screens (e.g., mobile phones)
      return baseSize;
    }
  }

  static TextStyle titleLarge(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, 24.0.fSize(context)),
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle title(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, 20.0.fSize(context)),
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle subtitle(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, 18.0.fSize(context)),
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle medium(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, 16.0.fSize(context)),
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle body(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, 14.0.fSize(context)),
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle bodySecondary(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, 14.0.adaptSize(context)),
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.textGrey,
    );
  }

  static TextStyle button(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, 14.0.fSize(context)),
      fontWeight: FontWeight.w500,
      color: color ?? Colors.white,
    );
  }

  static TextStyle small(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, 12.0.fSize(context)),
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle extraSmall(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, 10.fSize(context)),
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle genericTextStyle(BuildContext context,
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return TextStyle(
      fontSize:
          _getResponsiveFontSize(context, fontSize ?? 12.0.fSize(context)),
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? AppColors.textDark,
    );
  }
}
