import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:valorant_universe_remastered/app/l10n/app_l10n.g.dart';
import 'package:valorant_universe_remastered/app/theme/theme_constants.dart';
import 'package:valorant_universe_remastered/core/extensions/context_extension.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({required this.onPressed, super.key});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.theme.focusColor,
        shape: RoundedRectangleBorder(
          borderRadius: ThemeConstants.borderRadiusCircular,
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
