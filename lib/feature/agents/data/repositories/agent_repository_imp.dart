import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/failure/api_failure.dart';
import '../../domain/entities/agent/agent_entity.dart';
import '../../domain/repositories/agent_repository.dart';
import '../data_sources/remote/agents_remote_data_source.dart';
import '../model/agent/agent_model.dart';

class AgentRepositoryImp implements AgentRepository {
  AgentRepositoryImp({required this.agentsRemoteDataSource});

  final AgentsRemoteDataSource agentsRemoteDataSource;

  @override
  Future<Either<ApiFailure, List<AgentEntity>>> fetchAllAgents() async {
    try {
      final response = await agentsRemoteDataSource.fetchAgents();
      if (response == null) {
        return left(const ApiFailure.nullResponseFailure());
      }
      return right(response.map((e) => e.toAgentEntity()).toList());
    } on DioException catch (_) {
      return left(const ApiFailure.dioFailure());
    } catch (_) {
      return left(const ApiFailure.unknownFailure());
    }
  }
}
