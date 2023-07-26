part of '../view/agents_view.dart';

class _SortAgents extends StatelessWidget {
  const _SortAgents({required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final roles = LocaleKeys.roles.tr().split(':');
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => SizedBox(
        width: context.defaultValue,
      ),
      itemCount: roles.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => context.read<AgentsBloc>().add(AgentsSorted(index)),
          child: Container(
            padding: context.paddingHorizontalDefault,
            decoration: BoxDecoration(
              borderRadius: ThemeConstants.borderRadiusCircular,
              color: index == selectedIndex ? context.theme.focusColor : context.theme.disabledColor,
            ),
            child: Center(
              child: ValorantText(
                isTitle: false,
                text: roles[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
