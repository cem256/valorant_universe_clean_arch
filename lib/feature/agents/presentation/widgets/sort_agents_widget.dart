part of '../view/agents_view.dart';

class _SortAgents extends StatelessWidget {
  const _SortAgents({Key? key, required this.selectedIndex}) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => SizedBox(
        width: context.mediumValue,
      ),
      itemCount: Strings.roles.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => context.read<AgentsBloc>().add(AgentsSorted(index)),
          child: Container(
            padding: context.paddingHorizontalDefault,
            decoration: BoxDecoration(
              borderRadius: context.defaultBorderRadius,
              color: index == selectedIndex ? Colors.red : Colors.black,
            ),
            child: Center(
              child: ValorantText(
                text: Strings.roles[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
