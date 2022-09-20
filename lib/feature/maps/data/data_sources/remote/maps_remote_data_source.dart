import 'package:dio/dio.dart';

import '../../../../../core/exceptions/exceptions.dart';
import '../../model/map_model.dart';

class MapsRemoteDataSource {
  final Dio dio;

  MapsRemoteDataSource({required this.dio});

  Future<List<MapModel>> fetchMaps() async {
    try {
      final response = await dio.get("/maps");
      List? model = response.data["data"];
      if (model == null) {
        throw NullResponseException();
      } else {
        return model.map((e) => MapModel.fromJson(e)).toList();
      }
    } on DioError catch (e) {
      throw DioException(e.message);
    } catch (_) {
      throw UnknownException();
    }
  }
}
