class TimeConversionUtils {
  
  static String getSecondsToHourValue(int? value) {
    if (value == null) {
      return '';
    }
    int hours = value ~/ 3600;
    int minutes = (value % 3600) ~/ 60;
    String period = hours >= 12 ? 'PM' : 'AM';

    // Convert hour from 24-hour format to 12-hour format
    int displayHour = hours % 12 == 0 ? 12 : hours % 12;

    // Format hours, minutes into a string
    String formattedTime =
        '${displayHour.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} $period';
    return formattedTime;
  }
}