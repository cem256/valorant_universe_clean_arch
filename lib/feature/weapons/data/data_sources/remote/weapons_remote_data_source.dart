import 'package:dio/dio.dart';

import 'package:valorant_universe_remastered/core/exceptions/exceptions.dart';
import 'package:valorant_universe_remastered/feature/weapons/data/model/weapon/weapon_model.dart';

class WeaponsRemoteDataSource {
  WeaponsRemoteDataSource({required this.dio});
  final Dio dio;

  Future<List<WeaponModel>> fetchWeapons() async {
    try {
      final response = await dio.get<Map<String, dynamic>>('/weapons');
      final model = response.data?['data'] as List?;
      if (model == null) {
        throw NullResponseException();
      } else {
        return model.map((e) => WeaponModel.fromJson(e as Map<String, dynamic>)).toList();
      }
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions, message: e.message);
    } catch (_) {
      throw UnknownException();
    }
  }
}
