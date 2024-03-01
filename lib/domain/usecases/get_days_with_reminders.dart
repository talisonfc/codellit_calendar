import 'package:codelitt_calendar_ui/domain/datasources/reminder_datasource.dart';

abstract class IGetDaysWithReminders {
  Future<List<DateTime>> call(int year, int month);
}

class GetDaysWithReminders implements IGetDaysWithReminders {
  final IReminderDatasource datasource;

  GetDaysWithReminders(this.datasource);

  @override
  Future<List<DateTime>> call(int year, int month) async {
    return await datasource.getDaysWithReminders(
        '$year', month.toString().padLeft(2, '0'));
  }
}
