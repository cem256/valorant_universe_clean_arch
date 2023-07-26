import 'package:flutter/material.dart';

import 'package:valorant_universe_remastered/core/extensions/context_extension.dart';
import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/core/widgets/button/retry_button.dart';
import 'package:valorant_universe_remastered/core/widgets/text/valorant_error_text.dart';

class ValorantErrorWidget extends StatelessWidget {
  const ValorantErrorWidget({
    required this.failure,
    required this.onPressed,
    super.key,
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
