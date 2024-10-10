import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/core/error/exception.dart';
import 'package:kebormed/core/remote_data_source_mixin.dart';

class TestRemoteDataSource with RemoteDataSourceMixin {}

void main() {
  group('RemoteDataSourceMixin', () {
    test('calls factory function and returns result', () async {
      // Arrange
      factoryFunction() async => 'Success';
      final remoteDataSource = TestRemoteDataSource();

      // Act
      final result = await remoteDataSource.call<String>(factoryFunction);

      // Assert
      expect(result, 'Success');
    });

    test('rethrows HttpException', () async {
      // Arrange
      factoryFunction() async => throw HttpException();
      final remoteDataSource = TestRemoteDataSource();

      // Act and Assert
      expect(() async => await remoteDataSource.call<String>(factoryFunction),
          throwsA(isA<HttpException>()));
    });

    test('catches DistilException and rethrows with error message', () async {
      // Arrange
      factoryFunction() async => throw DistilException('Error message');
      final remoteDataSource = TestRemoteDataSource();

      // Act and Assert
      expect(() async => await remoteDataSource.call<String>(factoryFunction),
          throwsA(isA<DistilException>()));
    });

    test('catches unknown exception and rethrows as HttpException', () async {
      // Arrange
      factoryFunction() async => throw Exception('Unknown error');
      final remoteDataSource = TestRemoteDataSource();

      // Act and Assert
      expect(() async => await remoteDataSource.call<String>(factoryFunction),
          throwsA(isA<HttpException>()));
    });
  });
}
