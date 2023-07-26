import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/app/l10n/app_l10n.g.dart';
import 'package:valorant_universe_remastered/core/extensions/context_extension.dart';

class ValorantErrorText extends StatelessWidget {
  const ValorantErrorText({required this.failure, super.key});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Text(
      failure.when(
        dioFailure: (String? message) => LocaleKeys.errors_dio_error.tr(
          namedArgs: {'message': message ?? ''},
        ),
        unknownFailure: () => LocaleKeys.errors_unknown_error.tr(),
        nullResponseFailure: () => LocaleKeys.errors_null_response_error.tr(),
        noConnectionFailure: () => LocaleKeys.errors_no_connection_error.tr(),
      ),
      style: context.textTheme.titleMedium,
    );
  }
}
