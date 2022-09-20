import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/widgets/appbar/valorant_app_bar.dart';
import '../../../../core/widgets/image/custom_cached_network_image.dart';
import '../../../../core/widgets/text/valorant_text.dart';
import '../../domain/entities/map_entity.dart';

import '../../../../core/enums/page_status.dart';
import '../../../../core/failure/api_failure.dart';
import '../../../../core/locale/locale_keys.g.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/widgets/animation/loading_animation.dart';
import '../../../../core/widgets/error/valorant_error_widget.dart';
import '../../../../locator.dart';
import '../bloc/maps_bloc.dart';

part '../widgets/map_list_item.dart';

class MapsView extends StatelessWidget {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ValorantAppBar(title: LocaleKeys.common_maps.tr()),
      body: BlocProvider(
        create: (_) => getIt<MapsBloc>()..add(const MapsFetched()),
        child: const MapsViewBody(),
      ),
    );
  }
}

class MapsViewBody extends StatelessWidget {
  const MapsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsBloc, MapsState>(
      builder: (context, state) {
        if (state.status == PageStatus.initial || state.status == PageStatus.loading) {
          return const Center(
            child: LoadingAnimation(),
          );
        } else if (state.status == PageStatus.success) {
          List<MapEntity> maps = state.maps;
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
                        MapEntity map = maps[index];
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
