import 'package:codelitt_calendar_ui/presenter/codelitt_inherited_widget.dart';
import 'package:codelitt_calendar_ui/presenter/components/reminder_tile.dart';
import 'package:flutter/material.dart';

class RemindersList extends StatelessWidget {
  const RemindersList({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context
        .dependOnInheritedWidgetOfExactType<CodelittInheritedWidget>()!
        .state;
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 16, right: 24, left: 24),
          itemCount: state.reminders.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return ReminderTile(
              index: index,
              reminder: state.reminders[index],
              onEdit: (reminder) {
                state.openReminder(reminder);
              },
            );
          }),
    );
  }
}
