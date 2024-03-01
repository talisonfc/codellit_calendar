import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/empty_state.png'),
        const SizedBox(height: 16),
        Text(
          'No reminders registered so far',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
