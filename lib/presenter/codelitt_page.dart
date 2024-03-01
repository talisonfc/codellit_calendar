import 'package:codelitt_calendar_ui/presenter/codelitt_controller.dart';
import 'package:codelitt_calendar_ui/presenter/codelitt_inherited_widget.dart';
import 'package:codelitt_calendar_ui/presenter/components/codelitt_calendar.dart';
import 'package:codelitt_calendar_ui/presenter/components/footer.dart';
import 'package:codelitt_calendar_ui/presenter/components/header.dart';
import 'package:codelitt_calendar_ui/presenter/components/empty_state.dart';
import 'package:codelitt_calendar_ui/presenter/components/reminder_form.dart';
import 'package:codelitt_calendar_ui/presenter/components/reminders_list.dart';
import 'package:flutter/material.dart';

class CodelittPage extends StatefulWidget {
  const CodelittPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CodelittPageState();
}

class _CodelittPageState extends State<CodelittPage> {
  @override
  Widget build(BuildContext context) {
    final state = context
        .dependOnInheritedWidgetOfExactType<CodelittInheritedWidget>()!
        .state;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 32),
            Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFD1DCF0),
                    blurRadius: 28,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Header(),
                          const SizedBox(height: 16),
                          Expanded(child: buildBody(state.viewState)),
                          if (state.viewState == ViewState.form) const Footer()
                        ],
                      )),
                  Expanded(
                      child: CodelittCalendar(
                          daysWithReminders: state.daysWithReminders,
                          onNext: (date) {
                            state.loadDaysWithReminders(date.year, date.month);
                          },
                          onPrevious: (date) {
                            state.loadDaysWithReminders(date.year, date.month);
                          },
                          initialDate: DateTime.now(),
                          onTap: (day) {
                            state.loadRemindersByDay(day);
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody(ViewState view) {
    switch (view) {
      case ViewState.form:
        return const ReminderForm();
      case ViewState.list:
        return const RemindersList();
      case ViewState.emptyState:
        return const EmptyState();
      case ViewState.loading:
        return const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: CircularProgressIndicator()),
              SizedBox(height: 16),
              Text('Loading...'),
            ],
          ),
        );
    }
  }
}
