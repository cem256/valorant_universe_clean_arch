part of '../view/weapons_view.dart';

class _WeaponsGridCard extends StatelessWidget {
  const _WeaponsGridCard({required this.weapon});

  final WeaponEntity weapon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(
        WeaponDetailsRoute(
          weapon: weapon,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: context.defaultBorderRadius,
          color: context.theme.disabledColor,
        ),
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              flex: 2,
              child: Padding(
                padding: context.paddingAllDefault,
                child: Hero(
                  tag: weapon.displayName,
                  child: CustomCachedNetworkImage(
                    imageUrl: weapon.displayIcon,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ValorantText(
                  isTitle: true,
                  text: weapon.displayName,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
