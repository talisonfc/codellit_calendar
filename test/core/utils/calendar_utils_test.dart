import 'package:codelitt_calendar_ui/core/shared/utils/calendar_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalendarUtils', () {
    test('should return a List<int> with the first week of the month', () {
      // all 2024 first weeks
      [
        [-1, 1, 2, 3, 4, 5, 6],
        [-1, -1, -1, -1, 1, 2, 3],
        [-1, -1, -1, -1, -1, 1, 2],
        [-1, 1, 2, 3, 4, 5, 6],
        [-1, -1, -1, 1, 2, 3, 4],
        [-1, -1, -1, -1, -1, -1, 1],
        [-1, 1, 2, 3, 4, 5, 6],
        [-1, -1, -1, -1, 1, 2, 3],
        [1, 2, 3, 4, 5, 6, 7],
        [-1, -1, 1, 2, 3, 4, 5],
        [-1, -1, -1, -1, -1, 1, 2],
        [1, 2, 3, 4, 5, 6, 7],
      ].asMap().forEach((index, week) {
        final firstWeek =
            CalendarUtils.generateFirstWeekByYearAndMonth(2024, index + 1);

        expect(firstWeek.length, 7);
        expect(firstWeek, isA<List<int>>());
        expect(firstWeek, week);
      });
    });

    test('should return a List<int> with the last week of the month', () {
      // all 2024 last weeks
      [
        [28, 29, 30, 31, -1, -1, -1],
        [25, 26, 27, 28, 29, -1, -1],
        [31, -1, -1, -1, -1, -1, -1],
        [28, 29, 30, -1, -1, -1, -1],
        [26, 27, 28, 29, 30, 31, -1],
        [30, -1, -1, -1, -1, -1, -1],
        [28, 29, 30, 31, -1, -1, -1],
        [25, 26, 27, 28, 29, 30, 31],
        [29, 30, -1, -1, -1, -1, -1],
        [27, 28, 29, 30, 31, -1, -1],
        [24, 25, 26, 27, 28, 29, 30],
        [29, 30, 31, -1, -1, -1, -1],
      ].asMap().forEach((index, week) {
        final lastWeek =
            CalendarUtils.generateLastWeekByYearAndMonth(2024, index + 1);

        expect(lastWeek.length, 7);
        expect(lastWeek, isA<List<int>>());
        expect(lastWeek, week);
      });
    });

    test('should return a grid of days by year and month', () {
      final calendar = CalendarUtils.generateCalendarByMonth(2024, 2);
      expect(calendar, isA<List<List<int>>>());
      expect(calendar.length, 5);
      expect(calendar.first[4], 1);
      expect(calendar.last[0], 25);
    });

    test('should return a formatted string with the date', () {
      final date = DateTime(2024, 2, 1);
      final formattedDate = date.formattedWeekDayNameMonthDayYear;
      expect(formattedDate, 'Thursday, February 1, 2024');
    });

    test('should return true if the date is today', () {
      final date = DateTime.now();
      final isToday = date.isToday();
      expect(isToday, true);
      expect(DateTime(2023, 1, 1).isToday(), false);
    });
  });
}
