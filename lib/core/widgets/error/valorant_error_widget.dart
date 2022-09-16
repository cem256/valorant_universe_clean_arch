import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../failure/api_failure.dart';
import '../button/retry_button.dart';
import '../text/valorant_error_text.dart';

class ValorantErrorWidget extends StatelessWidget {
  const ValorantErrorWidget({
    super.key,
    required this.failure,
    required this.onPressed,
  });

  final ApiFailure failure;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: context.highValue,
            color: context.theme.focusColor,
          ),
          SizedBox(
            height: context.mediumValue,
          ),
          ValorantErrorText(
            failure: failure,
          ),
          SizedBox(
            height: context.mediumValue,
          ),
          RetryButton(
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
