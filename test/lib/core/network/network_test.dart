import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:kebormed/core/network/network_constants.dart';
import 'package:kebormed/core/network/network_info.dart';
import 'package:kebormed/core/network/simple_client.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('NetworkConstants', () {
    test('prodUrl should return the correct production URL', () {
      final networkConstants = NetworkConstants();
      expect(networkConstants.prodUrl, 'https://jsonplaceholder.typicode.com/');
    });

    test('devUrl should return the correct development URL', () {
      final networkConstants = NetworkConstants();
      expect(networkConstants.devUrl, 'https://jsonplaceholder.typicode.com/');
    });

    test('baseUrl should return the development URL', () {
      final networkConstants = NetworkConstants();
      expect(networkConstants.baseUrl, networkConstants.devUrl);
    });

    test('userListEndPoint should return the correct endpoint', () {
      final networkConstants = NetworkConstants();
      expect(networkConstants.userListEndPoint,
          'https://jsonplaceholder.typicode.com/users');
    });

    test('getHeadersForLogin should return the correct headers', () {
      final networkConstants = NetworkConstants();
      expect(networkConstants.getHeadersForLogin(),
          {'Content-Type': 'application/json'});
    });
  });

  group('NetworkInfoImpl', () {
    test('isConnected should return true if internet is reachable', () async {
      final networkInfo = NetworkInfoImpl();
      final result = await networkInfo.isConnected;
      expect(result, isTrue);
    });

    test('isConnected should return false if internet is not reachable',
        () async {});
  });

  group('SimpleClient', () {
    test('should send a GET request successfully', () async {
      // Arrange
      final client =
          SimpleClient(baseUrl: 'https://jsonplaceholder.typicode.com');
      final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

      // Act
      final response =
          await client.get(url, headers: {'Content-Type': 'application/json'});

      // Assert
      expect(response, isNotNull);
    });

    test('should send a POST request successfully', () async {
      // Arrange
      final client =
          SimpleClient(baseUrl: 'https://jsonplaceholder.typicode.com');
      final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      final body = {'title': 'foo', 'body': 'bar', 'userId': 1};

      // Act
      final response = await client.post(
        url,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );

      // Assert
      expect(response, isNotNull);
      expect(response['id'], isNotNull);
      expect(response['title'], 'foo');
    });

    test('should throw an HttpException on request failure', () async {
      // Arrange
      final client =
          SimpleClient(baseUrl: 'https://jsonplaceholder.typicode.com');
      final url = Uri.parse('https://jsonplaceholder.typicode.com/invalid-url');

      // Act and Assert
      expect(
          () async => await client
              .get(url, headers: {'Content-Type': 'application/json'}),
          throwsException);
    });
  });
}

// Mocking client for HTTP
class MockClient extends Mock implements http.Client {}
