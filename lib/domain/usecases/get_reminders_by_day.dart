import 'package:codelitt_calendar_ui/domain/datasources/reminder_datasource.dart';
import 'package:codelitt_calendar_ui/domain/entites/reminder_entity.dart';

abstract class IGerRemindersByDay {
  Future<List<ReminderEntity>> call(DateTime day);
}

class GetRemindersByDay implements IGerRemindersByDay {
  final IReminderDatasource datasource;

  GetRemindersByDay(this.datasource);

  @override
  Future<List<ReminderEntity>> call(DateTime day) async {
    return await datasource.getRemindersByDay(day);
  }
}
