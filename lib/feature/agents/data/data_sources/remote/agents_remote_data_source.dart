import 'package:dio/dio.dart';

import '../../../../../core/exceptions/exceptions.dart';
import '../../model/agent/agent_model.dart';

class AgentsRemoteDataSource {
  final Dio dio;

  AgentsRemoteDataSource({required this.dio});

  Future<List<AgentModel>?> fetchAgents() async {
    try {
      final response = await dio.get(
        "/agents",
        queryParameters: {"isPlayableCharacter": true},
      );
      List? model = response.data["data"];
      if (model == null) {
        return null;
      } else {
        return model.map((e) => AgentModel.fromJson(e)).toList();
      }
    } on DioError catch (_) {
      throw DioException();
    } catch (_) {
      throw UnknownException();
    }
  }
}
