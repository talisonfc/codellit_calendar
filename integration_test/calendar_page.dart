import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CalendarPage {
  // buttons
  Finder get btnAddNewReminder => find.byKey(const Key('btnAddNewReminder'));
  Finder get btnSaveReminder => find.byKey(const Key('btnSaveReminder'));
  Finder get btnDeleteReminder => find.byKey(const Key('btnDeleteReminder'));
  Finder get btnCancelReminder => find.byKey(const Key('btnCancelReminder'));
  Finder btnEditReminderByIndex(int index) =>
      find.byKey(Key('btnEditReminder$index'));
  Finder btnDay(int day) => find.byKey(Key('btnDay$day'));
  Finder get btnNextMonth => find.byKey(const Key('btnNextMonth'));
  Finder get btnPreviousMonth => find.byKey(const Key('btnPreviousMonth'));
  Finder btnColor(int index) => find.byKey(Key('color$index'));

  // inputs
  Finder get inputReminderTitle => find.byKey(const Key('inputReminderTitle'));
  Finder get inputReminderDescription =>
      find.byKey(const Key('inputReminderDescription'));
  Finder get inputReminderDate => find.byKey(const Key('inputReminderDate'));
  Finder get inputReminderTime => find.byKey(const Key('inputReminderTime'));
}
