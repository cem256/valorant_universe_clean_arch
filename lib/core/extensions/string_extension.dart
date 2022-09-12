import 'package:flutter/material.dart';

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    buffer.write('0XFF');
    buffer.write(hexString.substring(0, 6));
    return Color(int.parse(buffer.toString()));
  }
}
