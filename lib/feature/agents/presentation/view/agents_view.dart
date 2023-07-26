import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:valorant_universe_remastered/core/enums/page_status.dart';
import 'package:valorant_universe_remastered/core/extensions/context_extension.dart';
import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/core/locale/locale_keys.g.dart';
import 'package:valorant_universe_remastered/core/router/app_router.gr.dart';
import 'package:valorant_universe_remastered/core/widgets/animation/loading_animation.dart';
import 'package:valorant_universe_remastered/core/widgets/appbar/valorant_app_bar.dart';
import 'package:valorant_universe_remastered/core/widgets/error/valorant_error_widget.dart';
import 'package:valorant_universe_remastered/core/widgets/image/custom_cached_network_image.dart';
import 'package:valorant_universe_remastered/core/widgets/text/valorant_text.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/agent/agent_entity.dart';
import 'package:valorant_universe_remastered/feature/agents/presentation/bloc/agents_bloc.dart';

import 'package:valorant_universe_remastered/locator.dart';

part '../widgets/agents_grid_card.dart';
part '../widgets/agents_grid_view_widget.dart';
part '../widgets/sort_agents_widget.dart';

@RoutePage()
class AgentsView extends StatelessWidget {
  const AgentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ValorantAppBar(title: LocaleKeys.common_agents.tr()),
      body: BlocProvider(
        create: (context) => getIt<AgentsBloc>()..add(const AgentsEvent.agentsFetched()),
        child: const _AgentsViewBody(),
      ),
    );
  }
}

class _AgentsViewBody extends StatelessWidget {
  const _AgentsViewBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentsBloc, AgentsState>(
      builder: (context, state) {
        if (state.status == PageStatus.initial || state.status == PageStatus.loading) {
          return const Center(
            child: LoadingAnimation(),
          );
        } else if (state.status == PageStatus.success) {
          return Padding(
            padding: context.paddingHorizontalDefault,
            child: Column(
              children: [
                Expanded(
                  child: _SortAgents(selectedIndex: state.selectedIndex),
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                Expanded(
                  flex: 14,
                  child: _AgentsGridView(agents: state.agents),
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: context.paddingAllDefault,
            child: ValorantErrorWidget(
              failure: state.failure ?? const ApiFailure.unknownFailure(),
              onPressed: () => context.read<AgentsBloc>().add(const AgentsFetched()),
            ),
          );
        }
      },
    );
  }
}
