import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/locale/locale_keys.g.dart';
import '../../../core/widgets/appbar/valorant_app_bar.dart';
import '../../../core/widgets/image/custom_cached_network_image.dart';
import '../../maps/domain/entities/map_entity.dart';

class MapDetailView extends StatelessWidget {
  const MapDetailView({super.key, required this.map});

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
