part of '../view/agents_view.dart';

class _AgentsGridView extends StatelessWidget {
  const _AgentsGridView({required this.agents});

  final List<AgentEntity> agents;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: context.defaultValue,
        crossAxisSpacing: context.defaultValue,
        childAspectRatio: 3 / 4,
        crossAxisCount: 2,
      ),
      itemCount: agents.length,
      itemBuilder: (context, index) {
        final agent = agents[index];
        return _AgentsGridCard(agent: agent);
      },
    );
  }
}
