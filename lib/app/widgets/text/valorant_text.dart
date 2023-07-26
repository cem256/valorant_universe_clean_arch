import 'package:flutter/material.dart';

import 'package:valorant_universe_remastered/core/extensions/context_extension.dart';

class ValorantText extends StatelessWidget {
  const ValorantText({required this.text, required this.isTitle, super.key});

  final String text;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Valorant',
        fontSize: isTitle ? context.textTheme.titleLarge?.fontSize : context.textTheme.titleMedium?.fontSize,
      ),
    );
  }
}
