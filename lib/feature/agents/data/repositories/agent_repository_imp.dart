import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:valorant_universe_remastered/app/errors/exceptions/exceptions.dart';
import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/app/l10n/app_l10n.g.dart';
import 'package:valorant_universe_remastered/core/network/network_info.dart';
import 'package:valorant_universe_remastered/feature/agents/data/data_sources/remote/agents_remote_data_source.dart';
import 'package:valorant_universe_remastered/feature/agents/data/model/agent/agent_model.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/agent/agent_entity.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/repositories/agent_repository.dart';

final class AgentRepositoryImp implements AgentRepository {
  AgentRepositoryImp({required this.agentsRemoteDataSource, required this.networkInfo});

  final AgentsRemoteDataSource agentsRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<AgentEntity>>> fetchAllAgents() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await agentsRemoteDataSource.fetchAgents();

        return right(response.map((e) => e.toAgentEntity()).toList());
      } on DioException catch (e) {
        return left(Failure.dioFailure(e.message));
      } on NullResponseException catch (_) {
        return left(const Failure.nullResponseFailure());
      } catch (_) {
        return left(const Failure.unknownFailure());
      }
    } else {
      return left(const Failure.noConnectionFailure());
    }
  }

  @override
  List<AgentEntity> sortAgents({required List<AgentEntity> allAgents, required int index}) {
    if (index == 0) {
      return allAgents;
    } else {
      return allAgents.where((element) => element.role.displayName == LocaleKeys.roles.tr().split(':')[index]).toList();
    }
  }
}
