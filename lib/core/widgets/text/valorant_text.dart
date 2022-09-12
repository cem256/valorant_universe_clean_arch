import 'package:flutter/material.dart';

class ValorantText extends StatelessWidget {
  const ValorantText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: "Valorant",
      ),
    );
  }
}
