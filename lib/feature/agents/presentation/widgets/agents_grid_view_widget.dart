part of '../view/agents_view.dart';

class _AgentsGridView extends StatelessWidget {
  const _AgentsGridView({Key? key, required this.agents}) : super(key: key);

  final List<AgentEntity> agents;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: context.mediumValue,
          crossAxisSpacing: context.mediumValue,
          childAspectRatio: 3 / 4,
          crossAxisCount: 2),
      itemCount: agents.length,
      itemBuilder: (context, index) {
        final AgentEntity agent = agents[index];
        return ClipRRect(
          borderRadius: context.defaultBorderRadius,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: agent.backgroundGradientColors,
                  ),
                ),
              ),
              Column(
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
              )
            ],
          ),
        );
      },
    );
  }
}
