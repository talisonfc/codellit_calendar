import 'package:flutter/material.dart';
import '../../theme/text_style_color_extension.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key,
      this.onPressed,
      required this.label,
      this.gradient,
      this.color,
      this.loading = false});

  final void Function()? onPressed;
  final String label;
  final Gradient? gradient;
  final Color? color;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color,
        gradient: gradient,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFD1DCF0),
            blurRadius: 28,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: onPressed,
          child: loading
              ? SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.onPrimary)),
                )
              : Text(label,
                  style: Theme.of(context).textTheme.bodyLarge!.onPrimary)),
    );
  }
}
