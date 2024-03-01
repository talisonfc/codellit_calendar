import 'package:codelitt_calendar_ui/core/ds/theme/custom_color_schema.dart';
import 'package:codelitt_calendar_ui/core/ds/theme/text_style_color_extension.dart';
import 'package:codelitt_calendar_ui/core/shared/utils/calendar_utils.dart';
import 'package:codelitt_calendar_ui/core/ds/molecules/month_widget.dart';
import 'package:flutter/material.dart';

class CodelittCalendar extends StatefulWidget {
  const CodelittCalendar(
      {super.key,
      this.onTap,
      required this.initialDate,
      this.onNext,
      this.onPrevious,
      this.daysWithReminders = const []});

  final Function(DateTime)? onTap;
  final DateTime initialDate;
  final List<DateTime> daysWithReminders;
  final Function(DateTime)? onNext, onPrevious;

  @override
  State<CodelittCalendar> createState() => _CodelittCalendarState();
}

class _CodelittCalendarState extends State<CodelittCalendar> {
  late DateTime currentDate;

  @override
  void initState() {
    super.initState();

    currentDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF101277),
            Color(0xFF421F91),
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 64),
                RichText(
                    textAlign: TextAlign.center,
                    strutStyle:
                        const StrutStyle(forceStrutHeight: true, height: 2.2),
                    text: TextSpan(
                        style:
                            Theme.of(context).textTheme.displayLarge!.onPrimary,
                        children: [
                          TextSpan(
                              text: '${currentDate.year}\n',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .onPrimary
                                  .copyWith(fontWeight: FontWeight.w800)),
                          TextSpan(
                              text: monthNames[currentDate.month - 1],
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .onPrimary)
                        ])),
                const SizedBox(height: 32),
                Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      IconButton(
                          key: const Key('btnPreviousMonth'),
                          onPressed: () {
                            setState(() {
                              currentDate = currentDate.subtract(
                                  Duration(days: currentDate.day + 1));
                            });
                            widget.onPrevious?.call(currentDate);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: CustomColorSchema.onPrimary,
                          )),
                      const Icon(
                        Icons.circle,
                        color: CustomColorSchema.onPrimary,
                        size: 8,
                      ),
                      IconButton(
                          key: const Key('btnNextMonth'),
                          onPressed: () {
                            setState(() {
                              currentDate = currentDate.add(
                                  Duration(days: 31 - currentDate.day + 1));
                            });
                            widget.onNext?.call(currentDate);
                          },
                          icon: const Icon(Icons.arrow_forward_ios_rounded,
                              color: CustomColorSchema.onPrimary)),
                    ],
                  ),
                ),
                Center(
                  child: MonthWidget(
                    daysWithEvents: widget.daysWithReminders,
                    year: currentDate.year,
                    month: currentDate.month,
                    onTap: widget.onTap,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '© ${currentDate.year} Codelitt Inc All rights reserved',
            style:
                Theme.of(context).textTheme.labelSmall!.inter.onPrimary.light,
          ),
          const SizedBox(height: 48)
        ],
      ),
    );
  }
}
