import 'package:flutter/material.dart';

class ValorantAppBar extends StatelessWidget with PreferredSizeWidget {
  const ValorantAppBar({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "Valorant",
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
