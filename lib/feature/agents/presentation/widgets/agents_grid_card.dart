part of '../view/agents_view.dart';

class _AgentsGridCard extends StatelessWidget {
  const _AgentsGridCard({Key? key, required this.agent}) : super(key: key);

  final AgentEntity agent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(
        AgentDetailsRoute(agent: agent),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: context.defaultBorderRadius,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: agent.backgroundGradientColors,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: CustomCachedNetworkImage(
                  imageUrl: agent.fullPortrait,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ValorantText(
                  text: agent.displayName,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
