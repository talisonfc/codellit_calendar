import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFD1DCF0),
              blurRadius: 28,
              spreadRadius: 2,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: child);
  }
}
