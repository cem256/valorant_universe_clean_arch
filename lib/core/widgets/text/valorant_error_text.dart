import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:valorant_universe_remastered/core/extensions/context_extension.dart';
import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/core/locale/locale_keys.g.dart';

class ValorantErrorText extends StatelessWidget {
  const ValorantErrorText({required this.failure, super.key});

  final ApiFailure failure;

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
