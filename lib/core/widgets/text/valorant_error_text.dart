import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';
import '../../failure/api_failure.dart';

class ValorantErrorText extends StatelessWidget {
  const ValorantErrorText({super.key, required this.failure});

  final ApiFailure failure;

  @override
  Widget build(BuildContext context) {
    return Text(
      failure.when(
        dioFailure: (String message) => "Dio Error occured: $message",
        unknownFailure: () => "An unknown error occured.",
        nullResponseFailure: () => "No content error.",
        noConnectionFailure: () => "Please check your connection.",
      ),
      style: context.textTheme.titleMedium,
    );
  }
}
