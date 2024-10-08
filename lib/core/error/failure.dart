import 'package:equatable/equatable.dart';

import 'exception.dart';

abstract class Failure extends Equatable {
  final String commomFailureMessage = 'Something went wrong, please try again';
  @override
  List<Object> get props => [commomFailureMessage];
}

class HttpFailure extends Failure {
  final String exceptionText;
  final int? statusCode;
  final dynamic errorCode;
  final String? message;
  final String? requestId;

  HttpFailure({
    required this.exceptionText,
    this.statusCode,
    this.errorCode,
    this.message,
    this.requestId,
  });

  factory HttpFailure.fromException(HttpException e) {
    if (e.responseBody != null) {
      var map = e.responseBody;
      return HttpFailure(
        exceptionText: e.errorMessage ?? '',
        statusCode: e.statusCode,
        errorCode: map['errorCode'],
        message: map['message'],
        requestId: map['requestId'],
      );
    } else {
      return HttpFailure(exceptionText: e.errorMessage ?? '');
    }
  }
}

class NetworkFailure extends Failure {}

class CacheFailure extends Failure {}

class JSONFailure extends Failure {}

class DistilFailure extends Failure {}

class ServerFailure extends Failure {}
