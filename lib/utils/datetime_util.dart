import 'package:intl/intl.dart';

class DatetimeUtil {
  /// Returns date string in DD-MMM-YYYY format. Example: 26-Jan-1993
  static String toDateStringDDMMMYYYY(DateTime? dateTime) {
    // Returns current date if passed dateTime is null
    return DateFormat('dd-MMM-yyyy').format(dateTime ?? DateTime.now());
  }
}
