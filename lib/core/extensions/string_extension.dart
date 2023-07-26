import 'package:flutter/material.dart';

extension ColorExtension on String {
  Color toColor() {
    final hexString = this;
    final buffer = StringBuffer()
      ..write('0XFF')
      ..write(hexString.substring(0, 6));
    return Color(int.parse(buffer.toString()));
  }
}
