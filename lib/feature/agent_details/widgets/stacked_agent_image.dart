part of '../view/agent_details_view.dart';

class _StackedAgentImage extends StatelessWidget {
  const _StackedAgentImage({required this.agent});

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
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: context.veryHighValue4x,
              width: context.width,
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
                    isTitle: true,
                    text: agent.displayName,
                  ),
                  ValorantText(
                    isTitle: false,
                    text: agent.role.displayName,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
