import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:valorant_universe_remastered/core/constants/strings.dart';

class NetworkManager {
  NetworkManager() {
    dio = Dio(BaseOptions(baseUrl: Strings.valorantApiBaseUrl));
    if (kDebugMode) dio.interceptors.add(PrettyDioLogger(responseBody: false));
  }
  late final Dio dio;
}
