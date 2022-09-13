import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/widgets/image/custom_cached_network_image.dart';
import '../../../core/widgets/text/valorant_text.dart';
import '../../agents/domain/entities/ability/ability_entity.dart';
import '../../agents/domain/entities/agent/agent_entity.dart';

part '../widgets/agent_abilities.dart';
part '../widgets/stacked_agent_image.dart';

class AgentDetailsView extends StatelessWidget {
  const AgentDetailsView({super.key, required this.agent});

  final AgentEntity agent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _StackedAgentImage(agent: agent),
            Padding(
              padding: context.paddingAllDefault,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    agent.description,
                    style: context.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                  const ValorantText(
                    isTitle: true,
                    text: "Abilities",
                  ),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                  _AgentAbilities(agent: agent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
