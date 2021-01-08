class DateFormatter {
  static String formatForExpenseList(DateTime d) {
    final inTheLastWeek = DateTime.now().difference(d).inDays <= 7;
    final month = _months[d.month];

    if (inTheLastWeek) {
      return '${_dayOfWeek[d.weekday]}, $month ${d.day}';
    }

    return '$month ${d.day}, ${d.year}';
  }

  static String formatLong(DateTime d) {
    final month = _months[d.month];
    final day = d.day;
    final hour = d.hour;
    final seconds = d.second;
    final timezone = d.timeZoneName;

    return '$month $day, $hour:$seconds $timezone';
  }

  static List<String> get _months => [
        null,
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'November',
        'December'
      ];

  static List<String> get _dayOfWeek =>
      [null, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
}
