import 'package:codelitt_calendar_ui/core/ds/theme/custom_color_schema.dart';
import 'package:codelitt_calendar_ui/core/ds/theme/text_style_color_extension.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker(
      {super.key,
      this.onChanged,
      this.selectedColor,
      this.errorText,
      this.validationMessages = const {}});

  final String? errorText;
  final Function(Color)? onChanged;
  final Color? selectedColor;
  final Map<String, String> validationMessages;

  @override
  State<ColorPicker> createState() => _ColorPicker();
}

class _ColorPicker extends State<ColorPicker> {
  Color? _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.selectedColor;
  }

  final List<Color> colors = const [
    Color(0xFFC8E6C9),
    Color(0xFFF5DD29),
    Color(0xFFFFCC80),
    Color(0xFFEF9A9A),
    Color(0xFFCD8DE5),
    Color(0xFF5BA4CF),
    Color(0xFF29CCE5),
    Color(0xFF6DECA9),
    Color(0xFFFF8ED4),
    Color(0xFF312725),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color', style: Theme.of(context).textTheme.bodyLarge),
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: colors
                .asMap()
                .map((index, color) {
                  return MapEntry(
                      index,
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedColor = color;
                            widget.onChanged?.call(color);
                          });
                        },
                        child: Container(
                          key: Key('color$index'),
                          width: 55,
                          height: 48,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(6),
                            border: _selectedColor != null &&
                                    _selectedColor!.value == color.value
                                ? Border.all(
                                    color: CustomColorSchema.secondary,
                                    width: 4)
                                : Border.all(
                                    color: CustomColorSchema.onSurface
                                        .withOpacity(.4),
                                  ),
                          ),
                        ),
                      ));
                })
                .values
                .toList(),
          ),
        ),
        if (widget.errorText != null)
          Text(
              widget.validationMessages[widget.errorText!] ?? widget.errorText!,
              style: Theme.of(context).textTheme.bodySmall!.error)
      ],
    );
  }
}
