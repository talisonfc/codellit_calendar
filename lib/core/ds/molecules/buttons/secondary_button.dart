import 'package:codelitt_calendar_ui/core/ds/molecules/buttons/default_button.dart';
import 'package:codelitt_calendar_ui/core/ds/theme/custom_color_schema.dart';

class SecondaryButton extends DefaultButton {
  const SecondaryButton({
    super.key,
    required super.onPressed,
    required super.label,
  }) : super(
          color: CustomColorSchema.tertiary,
        );
}
