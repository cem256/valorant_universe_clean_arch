part of '../view/weapon_details_view.dart';

class _DamageRanges extends StatelessWidget {
  const _DamageRanges({super.key, required this.weaponStats});

  final WeaponStatsEntity weaponStats;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: context.mediumValue,
      ),
      itemCount: weaponStats.damageRanges.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _WeaponInfoTile(
              leftString: LocaleKeys.weapon_detail_damage_ranges_meters.tr(
                namedArgs: {
                  'start': weaponStats.damageRanges[index].rangeStartMeters,
                  'end': weaponStats.damageRanges[index].rangeEndMeters
                },
              ),
              rightString: '',
            ),
            const Divider(),
            _WeaponInfoTile(
              leftString: LocaleKeys.weapon_detail_head_damage.tr(),
              rightString: weaponStats.damageRanges[index].headDamage,
            ),
            const Divider(),
            _WeaponInfoTile(
              leftString: LocaleKeys.weapon_detail_body_damage.tr(),
              rightString: weaponStats.damageRanges[index].bodyDamage,
            ),
            const Divider(),
            _WeaponInfoTile(
              leftString: LocaleKeys.weapon_detail_leg_damage.tr(),
              rightString: weaponStats.damageRanges[index].legDamage,
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}
