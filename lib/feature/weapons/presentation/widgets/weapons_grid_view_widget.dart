part of '../view/weapons_view.dart';

class _WeaponsGridView extends StatelessWidget {
  const _WeaponsGridView({required this.weapons});

  final List<WeaponEntity> weapons;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: context.paddingHorizontalDefault,
      itemCount: weapons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: context.mediumValue,
        crossAxisSpacing: context.mediumValue,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return _WeaponsGridCard(weapon: weapons[index]);
      },
    );
  }
}
