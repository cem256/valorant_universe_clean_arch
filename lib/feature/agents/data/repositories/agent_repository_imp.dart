import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/failure/api_failure.dart';
import '../../../../core/locale/locale_keys.g.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/agent/agent_entity.dart';
import '../../domain/repositories/agent_repository.dart';
import '../data_sources/remote/agents_remote_data_source.dart';
import '../model/agent/agent_model.dart';

class AgentRepositoryImp implements AgentRepository {
  AgentRepositoryImp({required this.agentsRemoteDataSource, required this.networkInfo});

  final AgentsRemoteDataSource agentsRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<ApiFailure, List<AgentEntity>>> fetchAllAgents() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await agentsRemoteDataSource.fetchAgents();

        return right(response.map((e) => e.toAgentEntity()).toList());
      } on DioException catch (e) {
        return left(ApiFailure.dioFailure(e.message));
      } on NullResponseException catch (_) {
        return left(const ApiFailure.nullResponseFailure());
      } catch (_) {
        return left(const ApiFailure.unknownFailure());
      }
    } else {
      return left(const ApiFailure.noConnectionFailure());
    }
  }

  @override
  List<AgentEntity> sortAgents({required List<AgentEntity> allAgents, required int index}) {
    if (index == 0) {
      return allAgents;
    } else {
      return allAgents.where((element) => element.role.displayName == LocaleKeys.roles.tr().split(":")[index]).toList();
    }
  }
}
