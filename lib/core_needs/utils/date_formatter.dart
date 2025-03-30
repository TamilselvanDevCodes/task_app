sealed class DateFormatter {
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
  static DateTime getNextSunday({DateTime? fromDate}) {
    DateTime date = fromDate ?? DateTime.now();
    int daysToAdd = DateTime.sunday - date.weekday;
    if (daysToAdd <= 0) {
      daysToAdd += 7;
    }
    return date.add(Duration(days: daysToAdd));
  }

  static bool isToday({required DateTime dateTime}) {
    var currentDate = DateTime.now();
    return currentDate.year == dateTime.year && currentDate.month == dateTime.month && currentDate.day == dateTime.day;
  }

  static bool isYesterday({required DateTime dateTime}) {
    var yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.year == dateTime.year &&
        yesterday.month == dateTime.month &&
        yesterday.day == dateTime.day;
  }

  static bool isPastDate({required DateTime dateTime}) {
    var currentDate = DateTime.now();
    return dateTime.isBefore(currentDate) && !isYesterday(dateTime: dateTime) && !isToday(dateTime: dateTime);
  }

  static String formatDateForNotificationView({required DateTime dateTime}) {
    if (isToday(dateTime: dateTime)) {
      return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    } else if (isYesterday(dateTime: dateTime)) {
      return "Yesterday ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    } else {
      return "${dateTime.day.toString().padLeft(2, '0')}/"
          "${dateTime.month.toString().padLeft(2, '0')}/"
          "${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:"
          "${dateTime.minute.toString().padLeft(2, '0')}";
    }
  }


}
