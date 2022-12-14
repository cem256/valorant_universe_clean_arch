import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../locale/locale_keys.g.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.theme.focusColor,
        shape: RoundedRectangleBorder(
          borderRadius: context.defaultBorderRadius,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.refresh),
          SizedBox(
            width: context.lowValue,
          ),
          Text(LocaleKeys.retry.tr()),
        ],
      ),
    );
  }
}
