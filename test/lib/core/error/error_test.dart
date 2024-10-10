import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/core/error/exception.dart';
import 'package:kebormed/core/error/failure.dart';

void main() {
  group('Failure Classes', () {
    group('HttpFailure', () {
      test('should create HttpFailure from HttpException', () {
        // Arrange
        final httpException = HttpException(
          statusCode: 404,
          responseBody: {
            'errorCode': 'NOT_FOUND',
            'message': 'Not found',
            'requestId': '123'
          },
          errorMessage: 'Not found',
        );

        // Act
        final httpFailure = HttpFailure.fromException(httpException);

        // Assert
        expect(httpFailure.exceptionText, 'Not found');
        expect(httpFailure.statusCode, 404);
        expect(httpFailure.errorCode, 'NOT_FOUND');
        expect(httpFailure.message, 'Not found');
        expect(httpFailure.requestId, '123');
      });

      test(
          'fromException should create HttpFailure from HttpException with responseBody',
          () {
        // Arrange
        final responseBody = {
          'errorCode': '404',
          'message': 'Not Found',
          'requestId': '12345',
        };
        final httpException = HttpException(
          statusCode: 404,
          responseBody: responseBody,
          errorMessage: 'An error occurred',
        );

        // Act
        final failure = HttpFailure.fromException(httpException);

        // Assert
        expect(failure.exceptionText, 'An error occurred');
        expect(failure.statusCode, 404);
        expect(failure.errorCode, '404');
        expect(failure.message, 'Not Found');
        expect(failure.requestId, '12345');
      });
    });

    group('Other Failure Classes', () {
      test('should create NetworkFailure', () {
        // Act
        final networkFailure = NetworkFailure();

        // Assert
        expect(networkFailure, isA<Failure>());
      });

      test('should create CacheFailure', () {
        // Act
        final cacheFailure = CacheFailure();

        // Assert
        expect(cacheFailure, isA<Failure>());
      });

      test('should create JSONFailure', () {
        // Act
        final jsonFailure = JSONFailure();

        // Assert
        expect(jsonFailure, isA<Failure>());
      });

      test('should create DistilFailure', () {
        // Act
        final distilFailure = DistilFailure();

        // Assert
        expect(distilFailure, isA<Failure>());
      });

      test('should create ServerFailure', () {
        // Act
        final serverFailure = ServerFailure();

        // Assert
        expect(serverFailure, isA<Failure>());
      });
    });
  });
}
