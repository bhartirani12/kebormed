class DistilException implements Exception {
  final String error;
  DistilException(this.error);
}

class TokenRefreshException implements Exception {}

class HttpException implements Exception {
  final int? statusCode;
  final dynamic responseBody;
  final String? errorMessage;

  HttpException({
    this.statusCode,
    this.responseBody,
    this.errorMessage,
  });
}

class CacheException implements Exception {}
