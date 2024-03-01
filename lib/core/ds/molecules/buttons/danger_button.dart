import 'package:codelitt_calendar_ui/core/ds/molecules/buttons/default_button.dart';
import 'package:codelitt_calendar_ui/core/ds/theme/custom_color_schema.dart';

class DangerButton extends DefaultButton {
  const DangerButton(
      {super.key,
      required super.onPressed,
      required super.label,
      super.loading = false})
      : super(
          color: CustomColorSchema.error,
        );
}
