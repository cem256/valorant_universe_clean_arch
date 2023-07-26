import 'package:flutter/material.dart';
import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/app/widgets/button/retry_button.dart';
import 'package:valorant_universe_remastered/app/widgets/text/valorant_error_text.dart';
import 'package:valorant_universe_remastered/core/extensions/context_extension.dart';

class ValorantErrorWidget extends StatelessWidget {
  const ValorantErrorWidget({
    required this.failure,
    required this.onPressed,
    super.key,
  });

  final Failure failure;
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
            height: context.defaultValue,
          ),
          ValorantErrorText(
            failure: failure,
          ),
          SizedBox(
            height: context.defaultValue,
          ),
          RetryButton(
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
