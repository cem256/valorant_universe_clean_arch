import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/network_manager.dart';
import '../../data/data_sources/remote/agents_remote_data_source.dart';
import '../../data/repositories/agent_repository_imp.dart';
import '../bloc/agents_bloc.dart';

class AgentsView extends StatelessWidget {
  const AgentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agents View"),
      ),
      body: BlocProvider(
        create: (context) => AgentsBloc(
          agentRepository: AgentRepositoryImp(
            agentsRemoteDataSource: AgentsRemoteDataSource(dio: NetworkManager.instance.dio),
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
        return state.when(
          initial: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          succes: (agents) => const Center(
            child: Text("Success"),
          ),
          failure: () => const Center(
            child: Text("Something went wrong"),
          ),
        );
      },
    );
  }
}
