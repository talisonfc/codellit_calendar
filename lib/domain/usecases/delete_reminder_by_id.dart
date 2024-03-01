import 'package:codelitt_calendar_ui/domain/datasources/reminder_datasource.dart';

abstract class IDeleteReminderById {
  Future<void> call(String id);
}

class DeleteReminderById implements IDeleteReminderById {
  final IReminderDatasource datasource;

  DeleteReminderById(this.datasource);

  @override
  Future<void> call(String id) async {
    await datasource.deleteReminderById(id);
  }
}
