class CalendarUtils {
  static List<List<int>> generateCalendarByMonth(int year, int month) {
    final firstWeek = generateFirstWeekByYearAndMonth(year, month);
    final lastWeek = generateLastWeekByYearAndMonth(year, month);

    final days = [for (var i = firstWeek.last + 1; i < lastWeek.first; i++) i];

    return [
      firstWeek,
      ...List.generate(
        (days.length / 7).ceil(),
        (index) => days.sublist(index * 7, (index + 1) * 7),
      ),
      lastWeek,
    ];
  }

  static List<int> generateFirstWeekByYearAndMonth(int year, int month) {
    final firstDate = DateTime(year, month, 1);
    final indexFirstDay = firstDate.weekday;

    final firstWeek = [
      ...List.generate(indexFirstDay % 7, (index) => -1),
      ...List.generate(7 - indexFirstDay % 7, (index) => index + 1)
    ];
    return firstWeek;
  }

  static List<int> generateLastWeekByYearAndMonth(int year, int month) {
    final lastDate = DateTime(year, month + 1, 0);
    final indexLastDay = lastDate.weekday;
    final lastDay = lastDate.day;
    final lastWeek = [
      ...List.generate(indexLastDay % 7 + 1, (index) => lastDay - index)
          .reversed,
      ...List.generate(6 - indexLastDay % 7, (index) => -1)
    ];
    return lastWeek;
  }
}

extension DateTimeExtension on DateTime {
  String get formattedWeekDayNameMonthDayYear {
    return '${weekdayNames[weekday % 7]}, ${monthNames[month - 1]} $day, $year';
  }

  bool isToday() {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day == day;
  }
}

const List<String> monthNames = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

const List<String> weekdayShortNames = [
  'SUN',
  'MON',
  'TUE',
  'WED',
  'THU',
  'FRI',
  'SAT'
];

const List<String> weekdayNames = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
];
