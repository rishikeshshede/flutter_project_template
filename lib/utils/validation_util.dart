/// Handles validations throughout the app.
class ValidationUtil {
  static bool isEmailValid(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }

    // This regex pattern follows the general email validation rules but may not catch all cases of valid emails.
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);

    return regex.hasMatch(email);
  }
}
