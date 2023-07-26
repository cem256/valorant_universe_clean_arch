import 'package:dio/dio.dart';

import 'package:valorant_universe_remastered/app/errors/exceptions/exceptions.dart';
import 'package:valorant_universe_remastered/core/network/network_client.dart';
import 'package:valorant_universe_remastered/feature/agents/data/model/agent/agent_model.dart';

class AgentsRemoteDataSource {
  AgentsRemoteDataSource({required this.networkClient});
  final NetworkClient networkClient;

  Future<List<AgentModel>> fetchAgents() async {
    try {
      final response = await networkClient.get<Map<String, dynamic>>(
        '/agents',
        queryParameters: {'isPlayableCharacter': true},
      );
      final model = response.data?['data'] as List?;
      if (model == null) {
        throw NullResponseException();
      } else {
        return model.map((e) => AgentModel.fromJson(e as Map<String, dynamic>)).toList();
      }
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions, response: e.response);
    } catch (_) {
      throw UnknownException();
    }
  }
}
