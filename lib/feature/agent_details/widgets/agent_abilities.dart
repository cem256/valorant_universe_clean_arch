part of '../view/agent_details_view.dart';

class _AgentAbilities extends StatelessWidget {
  const _AgentAbilities({required this.agent});

  final AgentEntity agent;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: agent.abilities.length,
      itemBuilder: (context, index) {
        final ability = agent.abilities[index];
        return Row(
          children: [
            Expanded(
              child: SizedBox(
                height: context.highValue,
                child: CustomCachedNetworkImage(
                  imageUrl: ability.displayIcon,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ability.displayName.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: context.lowValue,
                  ),
                  Text(
                    ability.description,
                    style: TextStyle(color: context.theme.disabledColor),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
