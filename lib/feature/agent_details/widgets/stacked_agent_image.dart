part of '../view/agent_details_view.dart';

class _StackedAgentImage extends StatelessWidget {
  const _StackedAgentImage({Key? key, required this.agent}) : super(key: key);

  final AgentEntity agent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.veryHighValue5x,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: agent.backgroundGradientColors,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: context.veryHighValue4x,
              child: Hero(
                tag: agent.displayName,
                child: CustomCachedNetworkImage(
                  imageUrl: agent.fullPortrait,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: context.paddingLeftDefault,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValorantText(
                    text: agent.displayName,
                  ),
                  ValorantText(
                    text: agent.role.displayName,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
