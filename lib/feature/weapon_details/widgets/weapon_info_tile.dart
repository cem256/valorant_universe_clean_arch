part of '../view/weapon_details_view.dart';

class _WeaponInfoTile extends StatelessWidget {
  const _WeaponInfoTile({
    required this.leftString,
    required this.rightString,
  });

  final String leftString;
  final String rightString;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftString,
          style: context.textTheme.bodyText1,
        ),
        Text(
          rightString,
          style: context.textTheme.bodyText1,
        ),
      ],
    );
  }
}
