part of '../view/weapon_details_view.dart';

class _WeaponDetailCard extends StatelessWidget {
  const _WeaponDetailCard({required this.weapon});

  final WeaponEntity weapon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.veryHighValue2x,
      decoration: BoxDecoration(
        borderRadius: ThemeConstants.borderRadiusCircular,
        color: context.theme.disabledColor,
      ),
      child: Column(
        children: [
          const Spacer(),
          Expanded(
            flex: 2,
            child: Center(
              child: Hero(
                tag: weapon.displayName,
                child: CustomCachedNetworkImage(
                  imageUrl: weapon.displayIcon,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
