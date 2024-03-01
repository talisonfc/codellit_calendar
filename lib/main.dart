import 'package:codelitt_calendar_ui/core/shared/api_client.dart';
import 'package:codelitt_calendar_ui/data/datasources/reminder_datasource.dart';
import 'package:codelitt_calendar_ui/domain/usecases/delete_reminder_by_id.dart';
import 'package:codelitt_calendar_ui/domain/usecases/get_days_with_reminders.dart';
import 'package:codelitt_calendar_ui/domain/usecases/get_reminders_by_day.dart';
import 'package:codelitt_calendar_ui/domain/usecases/save_new_reminder.dart';
import 'package:codelitt_calendar_ui/presenter/codelitt_page.dart';
import 'package:codelitt_calendar_ui/presenter/codelitt_controller.dart';
import 'package:flutter/material.dart';

void main() {
  const apiKey = String.fromEnvironment('API_KEY');
  runApp(const CodelittCalendarApp(apiKey: apiKey));
}

class CodelittCalendarApp extends StatelessWidget {
  const CodelittCalendarApp({super.key, required this.apiKey});

  final String apiKey;

  @override
  Widget build(BuildContext context) {
    final datasource = ReminderDatasource(
        apiKey: apiKey,
        client: ApiClient(),
        baseUrl: 'https://api.calendar.codelitt.dev');
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Open Sans',
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all<Color>(const Color(0xFF421F91)),
          radius: const Radius.circular(4.0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            )),
            minimumSize: MaterialStateProperty.all<Size>(const Size(88, 49)),
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFFEBF3FE),
        useMaterial3: true,
      ),
      home: CodelittController(
          getDaysWithReminders: GetDaysWithReminders(datasource),
          getRemindersByDay: GetRemindersByDay(datasource),
          saveNewReminder: SaveNewReminder(datasource),
          deleteReminderById: DeleteReminderById(datasource),
          child: const CodelittPage()),
    );
  }
}
