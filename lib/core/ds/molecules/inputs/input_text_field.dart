import 'package:codelitt_calendar_ui/core/ds/theme/text_style_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatelessWidget {
  const InputTextField(
      {super.key,
      this.hintText,
      this.labelText,
      this.errorText,
      this.controller,
      this.inputFormatters = const [],
      this.validationMessages = const {},
      this.maxLines,
      this.maxLength,
      this.onChanged});

  final String? hintText, labelText, errorText;
  final TextEditingController? controller;
  final List<TextInputFormatter> inputFormatters;
  final void Function(String)? onChanged;
  final int? maxLines, maxLength;
  final Map<String, String> validationMessages;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText ?? '',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextField(
          key: key,
          controller: controller,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          maxLines: maxLines,
          maxLength: maxLength,
          decoration: InputDecoration(
              hintText: hintText,
              errorText: validationMessages[errorText],
              hintStyle: Theme.of(context).textTheme.bodyLarge!.hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: const Color(0xFF312725).withOpacity(.4)),
              )),
        ),
      ],
    );
  }
}
