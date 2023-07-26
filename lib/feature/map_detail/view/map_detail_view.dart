import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:valorant_universe_remastered/core/extensions/context_extension.dart';
import 'package:valorant_universe_remastered/core/locale/locale_keys.g.dart';
import 'package:valorant_universe_remastered/core/widgets/appbar/valorant_app_bar.dart';
import 'package:valorant_universe_remastered/core/widgets/image/custom_cached_network_image.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/entities/map_entity.dart';

@RoutePage()
class MapDetailView extends StatelessWidget {
  const MapDetailView({required this.map, super.key});

  final MapEntity map;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ValorantAppBar(title: map.displayName),
      body: Center(
        child: Padding(
          padding: context.paddingHorizontalDefault,
          child: Column(
            children: [
              SizedBox(
                height: context.veryHighValue5x,
                child: CustomCachedNetworkImage(
                  imageUrl: map.displayIcon,
                ),
              ),
              SizedBox(
                height: context.mediumValue,
              ),
              Text(
                LocaleKeys.map_detail_coordinates.tr(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: context.mediumValue,
              ),
              Text(
                map.coordinates,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
