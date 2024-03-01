import 'package:codelitt_calendar_ui/domain/entites/reminder_entity.dart';

abstract class IReminderDatasource {
  Future<ReminderEntity> createReminder(ReminderEntity reminder);
  Future<void> updateReminder(ReminderEntity reminder);
  Future<void> deleteReminderById(String id);
  Future<List<DateTime>> getDaysWithReminders(String year, String month);
  Future<List<ReminderEntity>> getRemindersByDay(DateTime day);
}
