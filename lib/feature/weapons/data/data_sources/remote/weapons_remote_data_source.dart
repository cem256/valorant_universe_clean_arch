import 'package:dio/dio.dart';

import '../../../../../core/exceptions/exceptions.dart';
import '../../model/weapon/weapon_model.dart';

class WeaponsRemoteDataSource {
  final Dio dio;

  WeaponsRemoteDataSource({required this.dio});

  Future<List<WeaponModel>?> fetchWeapons() async {
    try {
      final response = await dio.get("/weapons");
      List? model = response.data["data"];
      if (model == null) {
        return null;
      } else {
        return model.map((e) => WeaponModel.fromJson(e)).toList();
      }
    } on DioError catch (_) {
      throw DioException();
    } catch (_) {
      throw UnknownException();
    }
  }
}
