import 'package:dio/dio.dart';

import '../../../../../core/exceptions/exceptions.dart';
import '../../model/weapon/weapon_model.dart';

class WeaponsRemoteDataSource {
  final Dio dio;

  WeaponsRemoteDataSource({required this.dio});

  Future<List<WeaponModel>> fetchWeapons() async {
    try {
      final response = await dio.get("/weapons");
      List? model = response.data["data"];
      if (model == null) {
        throw NullResponseException();
      } else {
        return model.map((e) => WeaponModel.fromJson(e)).toList();
      }
    } on DioError catch (e) {
      throw DioException(e.message);
    } catch (_) {
      throw UnknownException();
    }
  }
}
