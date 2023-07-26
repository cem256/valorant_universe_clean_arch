part of '../view/weapon_details_view.dart';

class _DamageRanges extends StatelessWidget {
  const _DamageRanges({required this.weaponStats});

  final WeaponStatsEntity weaponStats;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: weaponStats.damageRanges.length,
      separatorBuilder: (context, index) => SizedBox(
        height: context.defaultValue,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _WeaponInfoTile(
              leading: LocaleKeys.weapon_detail_damage_ranges_meters.tr(
                namedArgs: {
                  'start': weaponStats.damageRanges[index].rangeStartMeters,
                  'end': weaponStats.damageRanges[index].rangeEndMeters
                },
              ),
              trailing: '',
            ),
            const Divider(),
            _WeaponInfoTile(
              leading: LocaleKeys.weapon_detail_head_damage.tr(),
              trailing: weaponStats.damageRanges[index].headDamage,
            ),
            const Divider(),
            _WeaponInfoTile(
              leading: LocaleKeys.weapon_detail_body_damage.tr(),
              trailing: weaponStats.damageRanges[index].bodyDamage,
            ),
            const Divider(),
            _WeaponInfoTile(
              leading: LocaleKeys.weapon_detail_leg_damage.tr(),
              trailing: weaponStats.damageRanges[index].legDamage,
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}
