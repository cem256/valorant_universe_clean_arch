import 'package:dio/dio.dart';

import 'package:valorant_universe_remastered/core/exceptions/exceptions.dart';
import 'package:valorant_universe_remastered/feature/agents/data/model/agent/agent_model.dart';

class AgentsRemoteDataSource {
  AgentsRemoteDataSource({required this.dio});
  final Dio dio;

  Future<List<AgentModel>> fetchAgents() async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
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
