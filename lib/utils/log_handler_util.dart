import 'package:logger/logger.dart';

/// A utility class for logging messages in the app.
///
/// **Features**:
/// - Unified logging interface.
/// - Adjustable log levels for different environments.
/// - Optional tagging for better log categorization.
///
/// **Usage**:
/// ```dart
/// LogUtil.d('Debug message', tag: 'AuthService');
/// LogUtil.i('Information message');
/// LogUtil.w('Warning message');
/// LogUtil.e('Error message', tag: 'Network');
/// LogUtil.v('Verbose message');
/// ```
class LogHandlerUtil {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Number of method calls to display.
      errorMethodCount: 8, // Number of error method calls.
      lineLength: 120, // Width of each log line.
      colors: true, // Enable/Disable log colors.
      printEmojis: true, // Enable/Disable emojis.
      dateTimeFormat:
          DateTimeFormat.dateAndTime, // Updated timestamp formatting.
    ),
  );

  // Environment flag to enable/disable logging (e.g., in production).
  static bool isProduction = false;

  /// Debug log.
  static void d(dynamic message, {String? tag}) {
    if (!isProduction) {
      _logger.d(_formatMessage(message, tag));
    }
  }

  /// Info log.
  static void i(dynamic message, {String? tag}) {
    if (!isProduction) {
      _logger.i(_formatMessage(message, tag));
    }
  }

  /// Warning log.
  static void w(dynamic message, {String? tag}) {
    if (!isProduction) {
      _logger.w(_formatMessage(message, tag));
    }
  }

  /// Error log.
  static void e(dynamic message, {String? tag}) {
    if (!isProduction) {
      _logger.e(_formatMessage(message, tag));
    }
  }

  /// Trace log.
  static void t(dynamic message, {String? tag}) {
    if (!isProduction) {
      _logger.t(_formatMessage(message, tag));
    }
  }

  /// Formats the log message with an optional tag.
  static String _formatMessage(dynamic message, String? tag) {
    return tag != null ? '[$tag] $message' : message.toString();
  }
}
