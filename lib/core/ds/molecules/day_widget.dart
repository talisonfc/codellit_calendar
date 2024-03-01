import 'package:codelitt_calendar_ui/core/ds/theme/custom_color_schema.dart';
import 'package:codelitt_calendar_ui/core/ds/theme/text_style_color_extension.dart';
import 'package:flutter/material.dart';

class DayWidget extends StatefulWidget {
  const DayWidget(
      {super.key,
      required this.day,
      this.onTap,
      this.today = false,
      this.hasReminders = false});

  final int day;
  final Function(int day)? onTap;
  final bool hasReminders, today;

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final font = Theme.of(context).textTheme.bodyLarge;

    return InkWell(
      onTap: widget.day != -1
          ? () {
              widget.onTap?.call(widget.day);
            }
          : null,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHover = false;
          });
        },
        child: Stack(
          children: [
            Container(
              key: Key('btnDay${widget.day}'),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: widget.day != -1 && isHover
                    ? CustomColorSchema.primary
                    : null,
                gradient: !isHover && widget.today
                    ? const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFFF465D),
                          Color(0xFFBC46BA),
                        ],
                      )
                    : null,
              ),
              child: Center(
                child: Text(widget.day == -1 ? '' : widget.day.toString(),
                    style: widget.day == -1
                        ? font!.lato.transparent
                        : isHover
                            ? font!.lato.surface
                            : font!.lato.onPrimary),
              ),
            ),
            if (widget.hasReminders)
              Positioned(
                right: 3,
                top: 3,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00FFCC),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
