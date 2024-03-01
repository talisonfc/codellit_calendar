import 'package:codelitt_calendar_ui/core/shared/utils/calendar_utils.dart';
import 'package:codelitt_calendar_ui/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'calendar_page.dart';

void main() {
  final page = CalendarPage();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('CodelittCalendarApp -', () {
    testWidgets('Delete all reminders and verify if list is empty',
        (tester) async {
      await tester.pumpWidget(const CodelittCalendarApp(apiKey: '123'));
      await tester.pumpAndSettle();

      for (final _ in [1, 2]) {
        await tester.tap(page.btnEditReminderByIndex(0));
        await tester.pumpAndSettle();
        await tester.tap(page.btnDeleteReminder);
        await tester.pumpAndSettle();
      }
      expect(find.text('No reminders registered so far'), findsOneWidget);
    });

    testWidgets('Add new reminder and veify if was loaded on list of reminders',
        (tester) async {
      await tester.pumpWidget(const CodelittCalendarApp(apiKey: '123'));
      await tester.pumpAndSettle();

      await tester.tap(page.btnAddNewReminder);
      await tester.pumpAndSettle();

      final today = DateTime.now();
      final formattedDate = today.formattedWeekDayNameMonthDayYear;
      expect(find.text('Add reminder - $formattedDate'), findsOneWidget);

      expect(find.byKey(const Key('btnEditReminder2')), findsNothing);
      await tester.enterText(page.inputReminderTitle, 'Standups and DS&T');
      await tester.pumpAndSettle();
      await tester.enterText(page.inputReminderDescription,
          'Codelitt Inc. is inviting to a Zoom meeting in which everyone as people from the company will participate.');
      await tester.pumpAndSettle();
      await tester.enterText(page.inputReminderDate, '2022-02-12');
      await tester.pumpAndSettle();
      await tester.enterText(page.inputReminderTime, '12:00');
      await tester.pumpAndSettle();
      await tester.tap(page.btnColor(1));
      await tester.pumpAndSettle();

      await tester.tap(page.btnSaveReminder);
      await tester.pumpAndSettle();

      // verify if is in list page
      expect(find.byKey(const Key('btnEditReminder2')), findsOneWidget);
    });

    testWidgets('Change date and verify if header title shows the new date',
        (tester) async {
      await tester.pumpWidget(const CodelittCalendarApp(apiKey: '123'));
      await tester.pumpAndSettle();

      final today = DateTime.now();
      expect(find.text(today.formattedWeekDayNameMonthDayYear), findsOneWidget);

      for (final day in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) {
        await tester.tap(page.btnDay(day));
        await tester.pumpAndSettle();

        expect(
            find.text(DateTime(today.year, today.month, day)
                .formattedWeekDayNameMonthDayYear),
            findsOneWidget);
      }
    });
  });
}
