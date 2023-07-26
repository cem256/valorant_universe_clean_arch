import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:valorant_universe_remastered/app/l10n/app_l10n.g.dart';
import 'package:valorant_universe_remastered/app/widgets/image/custom_cached_network_image.dart';
import 'package:valorant_universe_remastered/app/widgets/text/valorant_text.dart';
import 'package:valorant_universe_remastered/core/extensions/context_extension.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/agent/agent_entity.dart';

part '../widgets/agent_abilities.dart';
part '../widgets/stacked_agent_image.dart';

@RoutePage()
class AgentDetailsView extends StatelessWidget {
  const AgentDetailsView({required this.agent, super.key});

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
                    style: context.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: context.defaultValue,
                  ),
                  ValorantText(
                    isTitle: true,
                    text: LocaleKeys.abilities.tr(),
                  ),
                  SizedBox(
                    height: context.defaultValue,
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
