import 'package:intl/intl.dart';

class CustomDateUtils {
  static List<String> _monthList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static String getMonthNameFromMonthNumber(int value) {
    return _monthList[(value - 1)];
  }

  static String getFormattedDate(
      {String invalidDateString = "", required DateTime? date}) {
    if (date == null) {
      return invalidDateString;
    }
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String getFormattedTime(int? value) {
    if (value == null || value <= 0) {
      return '';
    }

    int hours = value ~/ 3600;
    int minutes = (value % 3600) ~/ 60;

    // Format hours and minutes into a string
    String formattedTime =
        '${(hours % 12).toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
    if (hours >= 12) {
      return formattedTime + " PM";
    } else {
      return formattedTime + " AM";
    }
  }

  static String getFormattedDateWithTime(
      {String invalidDateString = "", required DateTime? date}) {
    if (date == null) {
      return invalidDateString;
    }
    return DateFormat('dd/MM/yyyy - hh:mm a').format(date);
  }
}
