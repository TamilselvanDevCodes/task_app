class DateFormatter {
  /// Converts a "DD-MM-YYYY" formatted string to a DateTime object
  static DateTime parseDate(String dateString) {
    List<String> parts = dateString.split("-");
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);

    return DateTime(year, month, day);
  }

  /// Formats a DateTime object to "DD-MM-YYYY"
  static String formatDate(DateTime dateTime) {
    return "${dateTime.day.toString().padLeft(2, '0')}-"
        "${dateTime.month.toString().padLeft(2, '0')}-"
        "${dateTime.year}";
  }
}
