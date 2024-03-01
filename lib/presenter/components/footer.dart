import 'package:codelitt_calendar_ui/core/ds/molecules/buttons/danger_button.dart';
import 'package:codelitt_calendar_ui/core/ds/molecules/buttons/primary_button.dart';
import 'package:codelitt_calendar_ui/core/ds/molecules/buttons/secondary_button.dart';
import 'package:codelitt_calendar_ui/core/ds/theme/custom_color_schema.dart';
import 'package:codelitt_calendar_ui/presenter/codelitt_inherited_widget.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context
        .dependOnInheritedWidgetOfExactType<CodelittInheritedWidget>()!
        .state;
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: CustomColorSchema.tertiary.withOpacity(.2),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (state.currentReminder.id != null)
                DangerButton(
                    key: const Key('btnDeleteReminder'),
                    loading: state.deleteLoading,
                    onPressed: () {
                      state.delete();
                    },
                    label: 'Delete'),
              const SizedBox(width: 16),
              Wrap(
                children: [
                  SecondaryButton(
                      key: const Key('btnCancelReminder'),
                      onPressed: () {
                        state.cancel();
                      },
                      label: 'Cancel'),
                  const SizedBox(width: 16),
                  PrimaryButton(
                      key: const Key('btnSaveReminder'),
                      loading: state.saveLoading,
                      onPressed: () {
                        state.save();
                      },
                      label: 'Save'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
