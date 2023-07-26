part of '../view/weapon_details_view.dart';

class _WeaponInfoTile extends StatelessWidget {
  const _WeaponInfoTile({
    required this.leading,
    required this.trailing,
  });

  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leading,
          style: context.textTheme.bodyLarge,
        ),
        Text(
          trailing,
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
