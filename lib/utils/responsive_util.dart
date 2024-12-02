import 'package:flutter/widgets.dart';

/// Utility class for handling responsive design and layout scaling.
class ResponsiveUtil {
  static double _screenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double _screenHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static double _shortestSide(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return size.shortestSide;
  }

  /// Get the full screen width of the device.
  static double width(BuildContext context, double value) {
    return _screenWidth(context) * value;
  }

  /// Get the full screen height of the device.
  static double height(BuildContext context, double value) {
    return _screenHeight(context) * value;
  }

  /// Get the shortest side of the screen (either width or height).
  static double shortestSide(BuildContext context, double value) {
    return _shortestSide(context) * value;
  }
}
