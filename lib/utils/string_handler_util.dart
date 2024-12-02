/// Handels the string related operations.
class StringHandler {
  /// Capitalizes the first letter of a given string.
  ///
  /// If the string is empty or null, it returns the original string unchanged.
  /// If the first character is not alphabetic, it returns the string as is.
  static String capitalizeFirstLetter(String? text) {
    if (text == null || text.isEmpty) {
      return text ?? '';
    }

    if (RegExp(r'[a-zA-Z]').hasMatch(text[0])) {
      return "${text[0].toUpperCase()}${text.substring(1)}";
    }

    return text;
  }
}
