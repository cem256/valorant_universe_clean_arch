import 'package:dio/dio.dart';

import '../../../../../core/exceptions/exceptions.dart';
import '../../model/agent/agent_model.dart';

class AgentsRemoteDataSource {
  final Dio dio;

  AgentsRemoteDataSource({required this.dio});

  Future<List<AgentModel>> fetchAgents() async {
    try {
      final response = await dio.get(
        "/agents",
        queryParameters: {"isPlayableCharacter": true},
      );
      List? model = response.data["data"];
      if (model == null) {
        throw NullResponseException();
      } else {
        return model.map((e) => AgentModel.fromJson(e)).toList();
      }
    } on DioError catch (e) {
      throw DioException(e.message);
    } catch (_) {
      throw UnknownException();
    }
  }
}
