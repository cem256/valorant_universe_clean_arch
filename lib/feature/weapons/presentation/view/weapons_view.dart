import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/app/l10n/app_l10n.g.dart';
import 'package:valorant_universe_remastered/app/router/app_router.gr.dart';
import 'package:valorant_universe_remastered/app/theme/theme_constants.dart';
import 'package:valorant_universe_remastered/app/widgets/animation/custom_loading_animation.dart';
import 'package:valorant_universe_remastered/app/widgets/appbar/valorant_app_bar.dart';
import 'package:valorant_universe_remastered/app/widgets/error/valorant_error_widget.dart';
import 'package:valorant_universe_remastered/app/widgets/image/custom_cached_network_image.dart';
import 'package:valorant_universe_remastered/app/widgets/text/valorant_text.dart';
import 'package:valorant_universe_remastered/core/enums/page_status.dart';
import 'package:valorant_universe_remastered/core/extensions/context_extension.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon/weapon_entity.dart';
import 'package:valorant_universe_remastered/feature/weapons/presentation/bloc/weapons_bloc.dart';
import 'package:valorant_universe_remastered/locator.dart';

part '../widgets/weapons_grid_card.dart';
part '../widgets/weapons_grid_view_widget.dart';

@RoutePage()
class WeaponsView extends StatelessWidget {
  const WeaponsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ValorantAppBar(
        title: LocaleKeys.common_weapons.tr(),
      ),
      body: BlocProvider(
        create: (context) => Locator.instance<WeaponsBloc>()..add(const WeaponsEvent.weaponsFetched()),
        child: const _WeaponsViewBody(),
      ),
    );
  }
}

class _WeaponsViewBody extends StatelessWidget {
  const _WeaponsViewBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeaponsBloc, WeaponsState>(
      builder: (context, state) {
        return switch (state.status) {
          PageStatus.initial || PageStatus.loading => const Center(
              child: CustomLoadingAnimation(),
            ),
          PageStatus.failure => Padding(
              padding: context.paddingAllDefault,
              child: ValorantErrorWidget(
                failure: state.failure ?? const Failure.unknownFailure(),
                onPressed: () => context.read<WeaponsBloc>().add(const WeaponsFetched()),
              ),
            ),
          PageStatus.success => Column(
              children: [
                Expanded(
                  child: _WeaponsGridView(weapons: state.weapons),
                ),
              ],
            ),
        };
      },
    );
  }
}
