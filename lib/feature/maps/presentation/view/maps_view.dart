import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:valorant_universe_remastered/core/enums/page_status.dart';
import 'package:valorant_universe_remastered/core/extensions/context_extension.dart';
import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/core/locale/locale_keys.g.dart';
import 'package:valorant_universe_remastered/core/router/app_router.gr.dart';
import 'package:valorant_universe_remastered/core/widgets/animation/loading_animation.dart';
import 'package:valorant_universe_remastered/core/widgets/appbar/valorant_app_bar.dart';
import 'package:valorant_universe_remastered/core/widgets/error/valorant_error_widget.dart';
import 'package:valorant_universe_remastered/core/widgets/image/custom_cached_network_image.dart';
import 'package:valorant_universe_remastered/core/widgets/text/valorant_text.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/entities/map_entity.dart';
import 'package:valorant_universe_remastered/feature/maps/presentation/bloc/maps_bloc.dart';

import 'package:valorant_universe_remastered/locator.dart';

part '../widgets/map_list_item.dart';

@RoutePage()
class MapsView extends StatelessWidget {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ValorantAppBar(title: LocaleKeys.common_maps.tr()),
      body: BlocProvider(
        create: (context) => getIt<MapsBloc>()..add(const MapsEvent.mapsFetched()),
        child: const _MapsViewBody(),
      ),
    );
  }
}

class _MapsViewBody extends StatelessWidget {
  const _MapsViewBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsBloc, MapsState>(
      builder: (context, state) {
        if (state.status == PageStatus.initial || state.status == PageStatus.loading) {
          return const Center(
            child: LoadingAnimation(),
          );
        } else if (state.status == PageStatus.success) {
          final maps = state.maps;
          return Padding(
            padding: context.paddingHorizontalDefault,
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: context.mediumValue,
                      ),
                      itemCount: maps.length,
                      itemBuilder: (context, index) {
                        final map = maps[index];
                        return _MapListItem(map: map);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: context.paddingAllDefault,
            child: ValorantErrorWidget(
              failure: state.failure ?? const ApiFailure.unknownFailure(),
              onPressed: () => context.read<MapsBloc>().add(const MapsFetched()),
            ),
          );
        }
      },
    );
  }
}
