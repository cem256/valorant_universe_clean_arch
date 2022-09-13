import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class ValorantText extends StatelessWidget {
  const ValorantText({super.key, required this.text, required this.isTitle});

  final String text;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Valorant",
        fontSize: isTitle ? context.textTheme.titleLarge?.fontSize : context.textTheme.titleMedium?.fontSize,
      ),
    );
  }
}
