part of '../view/maps_view.dart';

class _MapListItem extends StatelessWidget {
  const _MapListItem({required this.map});

  final MapEntity map;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(MapDetailRoute(map: map)),
      child: ClipRRect(
        borderRadius: ThemeConstants.borderRadiusCircular,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomCachedNetworkImage(
              imageUrl: map.listViewIcon,
            ),
            ValorantText(
              text: map.displayName,
              isTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
