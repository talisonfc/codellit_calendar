import 'package:codelitt_calendar_ui/domain/entites/reminder_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ReminderEntity', () {
    test('should convert entity to Map', () {
      final reminder = ReminderEntity(
        title: 'Title',
        description: 'Description',
        date: '2022-12-12',
        time: '12:00',
      );

      final map = reminder.toMap();

      expect(map, isA<Map<String, dynamic>>());
      expect(map, {
        'id': null,
        'title': 'Title',
        'description': 'Description',
        'date': '2022-12-12T12:00:00.000',
        'color': '4280391411',
      });
    });

    test('should convert map to entity', () {
      final entity = ReminderEntity.fromMap({
        'title': 'Title',
        'description': 'Description',
        'date': '2022-12-12T12:00:00.000',
        'color': '4280391411',
      });
      expect(entity, isA<ReminderEntity>());
      expect(entity.date, '2022-12-12');
      expect(entity.time, '12:00');
    });

    test('should return a map of erros if empty', () {
      final reminder = ReminderEntity();

      expect(reminder.isValid, false);
      expect(reminder.errors(), isA<Map<String, String>>());

      expect(reminder.errors(), isA<Map<String, String>>());
      expect(reminder.errors(), {
        'title': 'required',
        'description': 'required',
        'date': 'required',
        'time': 'required',
        'color': 'required'
      });
    });
  });
}
