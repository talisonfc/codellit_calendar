import 'package:codelitt_calendar_ui/presenter/codelitt_controller.dart';
import 'package:flutter/material.dart';

class CodelittInheritedWidget extends InheritedWidget {
  final CodelittControllerState state;

  const CodelittInheritedWidget({
    super.key,
    required this.state,
    required super.child,
  });

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
