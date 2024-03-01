import 'dart:convert';

import 'package:codelitt_calendar_ui/core/shared/api_client.dart';
import 'package:codelitt_calendar_ui/data/datasources/mocks.dart';
import 'package:codelitt_calendar_ui/domain/datasources/reminder_datasource.dart';
import 'package:codelitt_calendar_ui/domain/entites/reminder_entity.dart';

class ReminderDatasource implements IReminderDatasource {
  final IApiClient client;
  final String baseUrl;
  final String apiKey;

  ReminderDatasource(
      {required this.client, required this.baseUrl, required this.apiKey});

  @override
  Future<ReminderEntity> createReminder(ReminderEntity reminder) async {
    final response = await client.post(Uri.parse('$baseUrl/reminders'),
        body: {
          'token': apiKey,
          ...reminder.toMap(),
        },
        mockResponse: mockCreateReminder);
    if (response.statusCode != 201) {
      throw Exception('Failed to create reminder');
    }
    return ReminderEntity.fromMap(jsonDecode(response.body));
  }

  @override
  Future<void> deleteReminderById(String id) async {
    final response = await client.delete(
        Uri.parse('$baseUrl/reminders/$apiKey/$id'),
        mockResponse: mockDeleteReminderById);
    if (response.statusCode != 200) {
      throw Exception('Failed to delete reminder');
    }
  }

  @override
  Future<List<DateTime>> getDaysWithReminders(String year, String month) async {
    final response = await client.get(
        Uri.parse('$baseUrl/reminders/$apiKey?date=$year-$month'),
        mockResponse: mockGetDaysWithReminders);
    if (response.statusCode != 200) {
      throw Exception('Failed to get reminders');
    }
    final List data = jsonDecode(response.body) as List;
    return data.map((item) => DateTime.parse(item['date'])).toList();
  }

  @override
  Future<void> updateReminder(ReminderEntity reminder) async {
    final response = await client.put(
      Uri.parse('$baseUrl/reminders/$apiKey/${reminder.id}'),
      body: reminder.toMap(),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update reminder');
    }
  }

  @override
  Future<List<ReminderEntity>> getRemindersByDay(DateTime day) async {
    final date = day.toIso8601String().split('T').first;
    final response = await client.get(
        Uri.parse('$baseUrl/reminders/$apiKey/by-day?date=$date'),
        mockResponse: mockGetRemindersByDay);
    if (response.statusCode != 200) {
      throw Exception('Failed to get reminders');
    }
    final List data = jsonDecode(response.body) as List;
    return data.map((e) => ReminderEntity.fromMap(e)).toList();
  }
}
