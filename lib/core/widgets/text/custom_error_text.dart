import 'package:flutter/material.dart';

class CustomErrorText extends StatelessWidget {
  const CustomErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Something went wrong",
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
