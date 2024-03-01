import 'package:codelitt_calendar_ui/core/ds/molecules/color_picker.dart';
import 'package:codelitt_calendar_ui/core/ds/molecules/inputs/input_text_field.dart';
import 'package:codelitt_calendar_ui/presenter/codelitt_inherited_widget.dart';
import 'package:codelitt_calendar_ui/core/ds/molecules/inputs/date_input_formatter.dart';
import 'package:codelitt_calendar_ui/core/ds/molecules/inputs/time_input_formater.dart';
import 'package:flutter/material.dart';

class ReminderForm extends StatelessWidget {
  const ReminderForm({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context
        .dependOnInheritedWidgetOfExactType<CodelittInheritedWidget>()!
        .state;
    final reminder = state.currentReminder;
    final errors = state.errors;
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      shrinkWrap: true,
      children: [
        InputTextField(
            key: const Key('inputReminderTitle'),
            controller: TextEditingController(text: reminder.title),
            onChanged: (value) => state.currentReminder.title = value,
            errorText: errors['title'],
            validationMessages: const {
              'required': 'Title is required',
            },
            maxLength: 30,
            labelText: 'Title',
            hintText: 'Title'),
        const SizedBox(height: 16),
        InputTextField(
          key: const Key('inputReminderDescription'),
          controller: TextEditingController(text: reminder.description),
          onChanged: (value) => state.currentReminder.description = value,
          errorText: errors['description'],
          labelText: 'Description',
          hintText: 'Description',
          validationMessages: const {
            'required': 'Description is required',
          },
          maxLines: 2,
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: InputTextField(
                key: const Key('inputReminderDate'),
                controller: TextEditingController(text: reminder.date),
                onChanged: (value) => state.currentReminder.date = value,
                errorText: errors['date'],
                inputFormatters: [DateInputFormatter()],
                validationMessages: const {
                  'required': 'Date is required',
                },
                labelText: 'Date',
                hintText: 'YYYY-MM-DD',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: InputTextField(
                key: const Key('inputReminderTime'),
                controller: TextEditingController(text: reminder.time),
                errorText: errors['time'],
                onChanged: (value) => state.currentReminder.time = value,
                inputFormatters: [TimeInputFormatter()],
                validationMessages: const {
                  'required': 'Time is required',
                },
                labelText: 'Time',
                hintText: 'HH:mm',
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        ColorPicker(
          errorText: errors['color'],
          selectedColor: reminder.color,
          validationMessages: const {
            'required': 'Color is required',
          },
          onChanged: (color) {
            state.currentReminder.color = color;
          },
        )
      ],
    );
  }
}
