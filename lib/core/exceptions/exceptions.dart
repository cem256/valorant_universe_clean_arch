class DioException implements Exception {
  DioException(this.message);
  final String message;
}

class UnknownException implements Exception {}

class NullResponseException implements Exception {}
