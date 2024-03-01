import 'package:codelitt_calendar_ui/domain/datasources/reminder_datasource.dart';
import 'package:codelitt_calendar_ui/domain/entites/reminder_entity.dart';

abstract class ISaveNewReminder {
  Future<ReminderEntity> call(ReminderEntity reminder);
}

class SaveNewReminder implements ISaveNewReminder {
  final IReminderDatasource datasource;

  SaveNewReminder(this.datasource);

  @override
  Future<ReminderEntity> call(ReminderEntity reminder) async {
    return await datasource.createReminder(reminder);
  }
}
