import 'package:codelitt_calendar_ui/core/ds/theme/text_style_color_extension.dart';
import 'package:codelitt_calendar_ui/core/shared/utils/calendar_utils.dart';
import 'package:codelitt_calendar_ui/core/ds/molecules/day_widget.dart';
import 'package:flutter/material.dart';

class MonthWidget extends StatelessWidget {
  const MonthWidget(
      {super.key,
      required this.year,
      required this.month,
      this.onTap,
      this.daysWithEvents = const []});

  final int year, month;
  final Function(DateTime day)? onTap;
  final List<DateTime> daysWithEvents;

  @override
  Widget build(BuildContext context) {
    final calendar = CalendarUtils.generateCalendarByMonth(year, month)
        .reduce((value, element) => [...value, ...element]);
    return Container(
      constraints: const BoxConstraints(maxWidth: 320),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: calendar.length + 7,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7),
          itemBuilder: (context, index) {
            if (index < 7) {
              return Center(
                  child: Text(
                weekdayShortNames[index],
                style: Theme.of(context).textTheme.bodySmall!.lato.onPrimary,
              ));
            }

            final day = calendar[index - 7];
            return Center(
                child: DayWidget(
                    day: day,
                    today: DateTime(year, month, day).isToday(),
                    hasReminders: daysWithEvents.contains(
                        DateTime.utc(year, month, calendar[index - 7])),
                    onTap: (day) {
                      onTap?.call(DateTime(year, month, day));
                    }));
          }),
    );
  }
}
