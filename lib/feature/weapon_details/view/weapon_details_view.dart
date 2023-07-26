import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:valorant_universe_remastered/app/l10n/app_l10n.g.dart';
import 'package:valorant_universe_remastered/app/theme/theme_constants.dart';
import 'package:valorant_universe_remastered/app/widgets/appbar/valorant_app_bar.dart';
import 'package:valorant_universe_remastered/app/widgets/image/custom_cached_network_image.dart';
import 'package:valorant_universe_remastered/app/widgets/text/valorant_text.dart';
import 'package:valorant_universe_remastered/core/extensions/context_extension.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon/weapon_entity.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon_stats/weapon_stats_entity.dart';

part '../widgets/damage_ranges.dart';
part '../widgets/weapon_detail_card.dart';
part '../widgets/weapon_info_tile.dart';

@RoutePage()
class WeaponDetailsView extends StatelessWidget {
  const WeaponDetailsView({required this.weapon, super.key});

  final WeaponEntity weapon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ValorantAppBar(
        title: weapon.displayName,
      ),
      body: Padding(
        padding: context.paddingHorizontalDefault,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _WeaponDetailCard(weapon: weapon),
              SizedBox(
                height: context.defaultValue,
              ),
              ValorantText(
                isTitle: true,
                text: LocaleKeys.weapon_detail_weapon_stats.tr(),
              ),
              SizedBox(
                height: context.defaultValue,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _WeaponInfoTile(
                    leading: LocaleKeys.weapon_detail_magazine_size.tr(),
                    trailing: weapon.weaponStats.magazineSize,
                  ),
                  const Divider(),
                  _WeaponInfoTile(
                    leading: LocaleKeys.weapon_detail_reload_time.tr(),
                    trailing: LocaleKeys.weapon_detail_reload_time_seconds
                        .tr(namedArgs: {'value': weapon.weaponStats.reloadTimeSeconds}),
                  ),
                  const Divider(),
                  _WeaponInfoTile(
                    leading: LocaleKeys.weapon_detail_fire_rate.tr(),
                    trailing: LocaleKeys.weapon_detail_fire_rate_seconds
                        .tr(namedArgs: {'value': weapon.weaponStats.fireRate}),
                  ),
                  const Divider(),
                  SizedBox(
                    height: context.defaultValue,
                  ),
                  Visibility(
                    visible: weapon.weaponStats.damageRanges.isNotEmpty,
                    child: ValorantText(
                      isTitle: true,
                      text: LocaleKeys.weapon_detail_damage_ranges.tr(),
                    ),
                  ),
                  SizedBox(
                    height: context.defaultValue,
                  ),
                  _DamageRanges(weaponStats: weapon.weaponStats)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
