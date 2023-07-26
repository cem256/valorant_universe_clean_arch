import 'package:dio/dio.dart';

import 'package:valorant_universe_remastered/core/exceptions/exceptions.dart';
import 'package:valorant_universe_remastered/feature/maps/data/model/map_model.dart';

class MapsRemoteDataSource {
  MapsRemoteDataSource({required this.dio});
  final Dio dio;

  Future<List<MapModel>> fetchMaps() async {
    try {
      final response = await dio.get<Map<String, dynamic>>('/maps');
      final model = response.data?['data'] as List?;
      if (model == null) {
        throw NullResponseException();
      } else {
        return model.map((e) => MapModel.fromJson(e as Map<String, dynamic>)).toList();
      }
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions, message: e.message);
    } catch (_) {
      throw UnknownException();
    }
  }
}
