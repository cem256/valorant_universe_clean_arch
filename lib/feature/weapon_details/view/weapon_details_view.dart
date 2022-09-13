import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/widgets/appbar/valorant_app_bar.dart';
import '../../../core/widgets/image/custom_cached_network_image.dart';
import '../../../core/widgets/text/valorant_text.dart';
import '../../weapons/domain/entities/weapon/weapon_entity.dart';
import '../../weapons/domain/entities/weapon_stats/weapon_stats_entity.dart';

part '../widgets/damage_ranges.dart';
part '../widgets/weapon_detail_card.dart';
part '../widgets/weapon_info_tile.dart';

class WeaponDetailsView extends StatelessWidget {
  const WeaponDetailsView({super.key, required this.weapon});

  final WeaponEntity weapon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ValorantAppBar(
        title: weapon.displayName,
      ),
      body: Padding(
        padding: context.paddingHorizontalDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _WeaponDetailCard(weapon: weapon),
            ),
            SizedBox(
              height: context.mediumValue,
            ),
            const ValorantText(
              isTitle: true,
              text: "Weapon Stats",
            ),
            SizedBox(
              height: context.mediumValue,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _WeaponInfoTile(
                    leftString: "Magazine Size",
                    rightString: weapon.weaponStats.magazineSize,
                  ),
                  const Divider(),
                  _WeaponInfoTile(
                    leftString: "Reload Time",
                    rightString: "${weapon.weaponStats.reloadTimeSeconds} sec",
                  ),
                  const Divider(),
                  _WeaponInfoTile(
                    leftString: "Fire Rate",
                    rightString: "${weapon.weaponStats.fireRate} / sec",
                  ),
                  const Divider(),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                  Visibility(
                    visible: weapon.weaponStats.damageRanges.isNotEmpty,
                    child: const ValorantText(
                      isTitle: true,
                      text: "Damage Ranges",
                    ),
                  ),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                  Expanded(
                    child: _DamageRanges(weaponStats: weapon.weaponStats),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
