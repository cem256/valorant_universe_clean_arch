import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/enums/page_status.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/failure/api_failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/network/network_manager.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/widgets/animation/loading_animation.dart';
import '../../../../core/widgets/appbar/valorant_app_bar.dart';
import '../../../../core/widgets/error/valorant_error_widget.dart';
import '../../../../core/widgets/image/custom_cached_network_image.dart';
import '../../../../core/widgets/text/valorant_text.dart';
import '../../data/data_sources/remote/agents_remote_data_source.dart';
import '../../data/repositories/agent_repository_imp.dart';
import '../../domain/entities/agent/agent_entity.dart';
import '../../domain/use_cases/fetch_all_agents_use_case.dart';
import '../bloc/agents_bloc.dart';

part '../widgets/agents_grid_card.dart';
part '../widgets/agents_grid_view_widget.dart';
part '../widgets/sort_agents_widget.dart';

class AgentsView extends StatelessWidget {
  const AgentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ValorantAppBar(title: "Agents"),
      body: BlocProvider(
        create: (context) => AgentsBloc(
          fetchAllAgentsUseCase: FetchAllAgentsUseCase(
            agentRepository: AgentRepositoryImp(
              agentsRemoteDataSource: AgentsRemoteDataSource(dio: NetworkManager.instance.dio),
              networkInfo: NetworkInfoImp(connectionChecker: InternetConnectionChecker()),
            ),
          ),
        )..add(const AgentsFetched()),
        child: const AgentsViewBody(),
      ),
    );
  }
}

class AgentsViewBody extends StatelessWidget {
  const AgentsViewBody({Key? key}) : super(key: key);

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
