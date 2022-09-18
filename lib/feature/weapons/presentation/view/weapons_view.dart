import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/page_status.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/failure/api_failure.dart';
import '../../../../core/locale/locale_keys.g.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/widgets/animation/loading_animation.dart';
import '../../../../core/widgets/appbar/valorant_app_bar.dart';
import '../../../../core/widgets/error/valorant_error_widget.dart';
import '../../../../core/widgets/image/custom_cached_network_image.dart';
import '../../../../core/widgets/text/valorant_text.dart';
import '../../../../locator.dart';
import '../../domain/entities/weapon/weapon_entity.dart';
import '../bloc/weapons_bloc.dart';

part '../widgets/weapons_grid_card.dart';
part '../widgets/weapons_grid_view_widget.dart';

class WeaponsView extends StatelessWidget {
  const WeaponsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ValorantAppBar(
        title: LocaleKeys.common_weapons.tr(),
      ),
      body: BlocProvider(
        create: (_) => getIt<WeaponsBloc>()..add(const WeaponsFetched()),
        child: const WeaponsViewBody(),
      ),
    );
  }
}

class WeaponsViewBody extends StatelessWidget {
  const WeaponsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeaponsBloc, WeaponsState>(
      builder: (context, state) {
        if (state.status == PageStatus.initial || state.status == PageStatus.loading) {
          return const Center(
            child: LoadingAnimation(),
          );
        } else if (state.status == PageStatus.success) {
          return Column(
            children: [
              Expanded(
                child: _WeaponsGridView(weapons: state.weapons),
              ),
            ],
          );
        } else {
          return Padding(
            padding: context.paddingAllDefault,
            child: ValorantErrorWidget(
              failure: state.failure ?? const ApiFailure.unknownFailure(),
              onPressed: () => context.read<WeaponsBloc>().add(const WeaponsFetched()),
            ),
          );
        }
      },
    );
  }
}
