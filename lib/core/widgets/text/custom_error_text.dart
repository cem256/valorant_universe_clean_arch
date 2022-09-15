import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../failure/api_failure.dart';

class CustomErrorText extends StatelessWidget {
  const CustomErrorText({super.key, required this.failure});

  final ApiFailure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _getFailureMessage(failure),
        style: context.textTheme.titleMedium,
      ),
    );
  }

  String _getFailureMessage(ApiFailure failure) {
    return failure.when(
        dioFailure: (String message) => "Dio Error occured: $message",
        unknownFailure: () => "An unknown error occured.",
        nullResponseFailure: () => "No content error.",
        noConnectionFailure: () => "Please check your connection.");
  }
}
