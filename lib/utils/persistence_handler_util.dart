import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_project_template/utils/log_handler_util.dart';

/// A singleton utility class for interacting with SharedPreferences to
/// store, retrieve, delete, and clear key-value pairs persistently.
///
/// This class is designed for:
/// - Storing various types of data (String, bool, int, double, List<String>) locally.
/// - Ensuring the local data is accessible throughout the app.
/// - Providing centralized logging for all persistent operations.
/// - Error handling to avoid crashes when interacting with SharedPreferences.
///
/// **Usage**:
/// - Set data: `PersistenceHandler.set<String>('key', 'value')`
/// - Get data: `String? value = await PersistenceHandler.get<String>('key')`
/// - Delete data: `await PersistenceHandler.delete('key')`
/// - Clear all data: `await PersistenceHandler.clearAll()`
class PersistenceHandler {
  static SharedPreferences? _sharedPreferences;

  // Private constructor to prevent instantiation of the class.
  PersistenceHandler._();

  // Singleton pattern to ensure one instance of SharedPreferences.
  static Future<void> init() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
      LogHandlerUtil.i('SharedPreferences initialized');
    }
  }

  // Centralized logging function, can be turned on/off based on environment.
  static void _logValue(String key, dynamic value) {
    LogHandlerUtil.d("Persistence Set - $key: $value");
  }

  // ------------- SET values -------------

  // Generic setter method for different data types
  static Future<void> set<T>(String key, T value) async {
    await init();
    if (value is String) {
      await _sharedPreferences?.setString(key, value);
    } else if (value is bool) {
      await _sharedPreferences?.setBool(key, value);
    } else if (value is int) {
      await _sharedPreferences?.setInt(key, value);
    } else if (value is double) {
      await _sharedPreferences?.setDouble(key, value);
    } else if (value is List<String>) {
      await _sharedPreferences?.setStringList(key, value);
    }
    _logValue(key, value);
  }

  // ------------- GET values -------------

  // Generic getter method for different data types
  static Future<T?> get<T>(String key) async {
    await init();
    T? value;

    if (T == String) {
      value = _sharedPreferences?.getString(key) as T?;
    } else if (T == bool) {
      value = _sharedPreferences?.getBool(key) as T?;
    } else if (T == int) {
      value = _sharedPreferences?.getInt(key) as T?;
    } else if (T == double) {
      value = _sharedPreferences?.getDouble(key) as T?;
    } else if (T == List<String>) {
      value = _sharedPreferences?.getStringList(key) as T?;
    }

    if (value != null) {
      LogHandlerUtil.d("Persistence Get - $key: $value");
    }
    return value;
  }

  // ------------- DELETE values -------------

  // Deletes a specific key-value pair
  static Future<void> delete(String key) async {
    await init();
    bool success = await _sharedPreferences?.remove(key) ?? false;
    if (success) {
      LogHandlerUtil.d("Deleted key: $key");
    } else {
      LogHandlerUtil.d("Failed to delete key: $key");
    }
  }

  // Clears all data from SharedPreferences
  static Future<void> deleteAll() async {
    await init();
    bool success = await _sharedPreferences?.clear() ?? false;
    if (success) {
      LogHandlerUtil.d("All data cleared from SharedPreferences");
    } else {
      LogHandlerUtil.d("Failed to clear SharedPreferences");
    }
  }
}
