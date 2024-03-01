import 'package:codelitt_calendar_ui/core/ds/molecules/buttons/default_button.dart';
import 'package:codelitt_calendar_ui/core/ds/theme/text_style_color_extension.dart';
import 'package:codelitt_calendar_ui/core/shared/utils/calendar_utils.dart';
import 'package:codelitt_calendar_ui/presenter/codelitt_controller.dart';
import 'package:codelitt_calendar_ui/presenter/codelitt_inherited_widget.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context
        .dependOnInheritedWidgetOfExactType<CodelittInheritedWidget>()!
        .state;
    final formattedDate = state.selectedDate.formattedWeekDayNameMonthDayYear;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(right: 32, left: 32, top: 32, bottom: 16),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        children: [
          Text(
              state.viewState == ViewState.form
                  ? 'Add reminder - $formattedDate'
                  : formattedDate,
              style: Theme.of(context).textTheme.titleLarge!.semiBold),
          if (state.viewState != ViewState.form)
            DefaultButton(
                key: const Key('btnAddNewReminder'),
                onPressed: () {
                  state.createNew();
                },
                gradient: const LinearGradient(
                    colors: [Color(0xFFFF465D), Color(0xFFBC46BA)]),
                label: 'Add reminder'),
        ],
      ),
    );
  }
}
