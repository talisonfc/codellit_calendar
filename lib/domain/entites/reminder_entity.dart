import 'package:flutter/material.dart';

extension ColorExtension on Color {
  String get toHex {
    return '#${value.toRadixString(16).substring(2, 8)}';
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}

class ReminderEntity {
  String? id;
  String? title;
  String? description;
  String? date;
  String? time;
  Color? color;

  ReminderEntity(
      {this.id,
      this.title,
      this.description,
      this.date,
      this.time,
      this.color});

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'date': DateTime.parse('$date $time').toIso8601String(),
      if (color != null) 'color': color!.toHex,
    };
  }

  factory ReminderEntity.fromMap(Map<String, dynamic> map) {
    return ReminderEntity(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'].split('T').first,
      time: map['date'].split('T').last.split(':').sublist(0, 2).join(':'),
      color: HexColor(map['color']),
    );
  }

  DateTime get dateTime {
    return DateTime.parse('$date');
  }

  ReminderEntity copyWith({
    String? id,
    String? title,
    String? description,
    String? date,
    String? time,
    Color? color,
  }) {
    return ReminderEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
      color: color ?? this.color,
    );
  }

  bool get isValid {
    return errors().isEmpty;
  }

  Map<String, String> errors() {
    final errors = <String, String>{};
    if (title == null || title!.isEmpty) {
      errors['title'] = 'required';
    }
    if (description == null || description!.isEmpty) {
      errors['description'] = 'required';
    }
    if (date == null || date!.isEmpty) {
      errors['date'] = 'required';
    }
    if (time == null || time!.isEmpty) {
      errors['time'] = 'required';
    }
    if (color == null) {
      errors['color'] = 'required';
    }

    return errors;
  }
}
