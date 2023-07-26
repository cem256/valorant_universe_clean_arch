import 'package:dio/dio.dart';

import 'package:valorant_universe_remastered/app/errors/exceptions/exceptions.dart';
import 'package:valorant_universe_remastered/core/network/network_client.dart';
import 'package:valorant_universe_remastered/feature/weapons/data/model/weapon/weapon_model.dart';

class WeaponsRemoteDataSource {
  WeaponsRemoteDataSource({required this.networkClient});
  final NetworkClient networkClient;

  Future<List<WeaponModel>> fetchWeapons() async {
    try {
      final response = await networkClient.get<Map<String, dynamic>>('/weapons');
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
