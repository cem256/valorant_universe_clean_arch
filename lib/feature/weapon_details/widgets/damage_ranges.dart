part of '../view/weapon_details_view.dart';

class _DamageRanges extends StatelessWidget {
  const _DamageRanges({Key? key, required this.weaponStats}) : super(key: key);

  final WeaponStatsEntity weaponStats;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: ((context, index) => SizedBox(
            height: context.mediumValue,
          )),
      itemCount: weaponStats.damageRanges.length,
      itemBuilder: ((context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _WeaponInfoTile(
              leftString:
                  "${weaponStats.damageRanges[index].rangeStartMeters} - ${weaponStats.damageRanges[index].rangeEndMeters} meters",
              rightString: "",
            ),
            const Divider(),
            _WeaponInfoTile(
              leftString: "Head Damage",
              rightString: weaponStats.damageRanges[index].headDamage,
            ),
            const Divider(),
            _WeaponInfoTile(
              leftString: "Body Damage",
              rightString: weaponStats.damageRanges[index].bodyDamage,
            ),
            const Divider(),
            _WeaponInfoTile(
              leftString: "Leg Damage",
              rightString: weaponStats.damageRanges[index].legDamage,
            ),
            const Divider(),
          ],
        );
      }),
    );
  }
}
