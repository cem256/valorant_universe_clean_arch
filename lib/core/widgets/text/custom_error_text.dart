import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class CustomErrorText extends StatelessWidget {
  const CustomErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Something went wrong",
        style: context.textTheme.titleMedium,
      ),
    );
  }
}
