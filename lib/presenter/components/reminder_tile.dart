import 'package:codelitt_calendar_ui/core/ds/atoms/card_widget.dart';
import 'package:codelitt_calendar_ui/core/ds/theme/custom_color_schema.dart';
import 'package:codelitt_calendar_ui/core/ds/theme/text_style_color_extension.dart';
import 'package:codelitt_calendar_ui/domain/entites/reminder_entity.dart';
import 'package:flutter/material.dart';

class ReminderTile extends StatelessWidget {
  const ReminderTile(
      {super.key, required this.index, required this.reminder, this.onEdit});

  final int index;
  final ReminderEntity reminder;
  final Function(ReminderEntity)? onEdit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CardWidget(
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 12,
                  height: 111,
                  decoration: BoxDecoration(
                    color: reminder.color,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: '${reminder.title}\n',
                      style: Theme.of(context).textTheme.titleSmall!.tertiary,
                    ),
                    TextSpan(
                        text: reminder.description,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .onSurface
                            .copyWith(fontWeight: FontWeight.w600)),
                  ]),
                ),
              )),
              Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Color(0xFFD1DCF0),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.access_time_rounded,
                        size: 32,
                        color: CustomColorSchema.tertiary,
                      ),
                      Text('${reminder.time}',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .semiBold
                              .tertiary)
                    ],
                  )),
            ]),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF3BC6FB),
                  Color(0xFF00FFCC),
                ],
              ),
            ),
            child: IconButton(
              key: Key('btnEditReminder$index'),
              icon: const Icon(Icons.mode_edit_outlined, color: Colors.white),
              onPressed: () {
                onEdit?.call(reminder);
              },
            ),
          ),
        )
      ],
    );
  }
}
