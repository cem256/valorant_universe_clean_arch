import 'package:dartz/dartz.dart';

import '../../../../core/failure/api_failure.dart';
import '../entities/agent/agent_entity.dart';

abstract class AgentRepository {
  Future<Either<ApiFailure, List<AgentEntity>>> fetchAllAgents();
  List<AgentEntity> sortAgents({required List<AgentEntity> allAgents, required int index});
}
