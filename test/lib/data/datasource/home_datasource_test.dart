// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart';
// import 'package:kebormed/core/network/simple_client.dart';
// import 'package:kebormed/data/datasource/home_datasource.dart';
// import 'package:kebormed/data/model/home_model.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import '../../fixture/fixture_reader.dart';
// import 'home_datasource_test.mocks.dart';

// @GenerateMocks([HomeDatasource, SimpleClient])
// void main() {
//   late MockHomeDatasource dataSource;
//   late MockSimpleClient mockHttpClient;
//   late List<UserListModel> userList;
//   setUp(() {
//     mockHttpClient = MockSimpleClient();
//     dataSource = MockHomeDatasource();
//     userList = [
//       const UserListModel(
//         name: 'John Doe',
//         email: 'johndoe@example.com',
//         phone: '123-456-7890',
//         website: 'https://example.com',
//         address: AddressModel(
//           suite: 'Apt 101',
//           street: '123 Main St',
//           city: 'Anytown',
//           zipcode: '12345',
//           geo: GeoModel(lat: '37.7749', lng: '-122.4194'),
//         ),
//         company: CompanyModel(
//           name: 'ABC Inc.',
//           catchPhrase: '',
//           bs: '',
//         ),
//       ),
//       const UserListModel(
//         name: 'Test Test',
//         email: 'johndoe1@example.com',
//         phone: '123-456-7890s222',
//         website: 'https://exampletest.com',
//         address: AddressModel(
//           suite: 'Apt 101sdsd',
//           street: '123 Main Stsdsd',
//           city: 'Anytowdsd',
//           zipcode: '12345sdsd',
//           geo: GeoModel(lat: '37.7749sds', lng: '-122.4194sds'),
//         ),
//         company: CompanyModel(
//           name: 'MP Inc.',
//           catchPhrase: '',
//           bs: '',
//         ),
//       )
//     ];
//   });

//   void setUpMockHttpClientSuccess200() {
//     when(mockHttpClient.get(any, headers: anyNamed('headers')))
//         .thenAnswer((_) async => Response(fixture('userdata.json'), 200));
//   }

//   group('GetUserList', () {
//     test(
//       'should return userList when the response code is 200 (success)',
//       () async {
//         // arrange
//         setUpMockHttpClientSuccess200();
//         // act
//         when(dataSource.getUserList()).thenAnswer((_) async => userList);

//         final result = await dataSource.getUserList();
//         // assert
//         expect(result, equals(userList));
//       },
//     );
//   });
// }

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:kebormed/data/datasource/home_datasource.dart'; // Adjust this import to your project structure
import 'package:kebormed/core/network/simple_client.dart';
import 'package:kebormed/core/network/network_constants.dart';
import 'package:kebormed/data/model/home_model.dart';

import 'home_datasource_test.mocks.dart';

// Mock classes
@GenerateMocks([SimpleClient, NetworkConstants])
void main() {
  late HomeDatasource dataSource;
  late MockSimpleClient mockClient;
  late MockNetworkConstants mockNetworkConstants;

  setUp(() {
    mockClient = MockSimpleClient();
    mockNetworkConstants = MockNetworkConstants();
    dataSource = HomeDatasource(mockClient, mockNetworkConstants);
  });

  group('getUserList', () {
    final tUserListJson = [
      {
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'phone': '123-456-7890',
        'address': {
          'street': '123 Main St',
          'suite': 'Apt 101',
          'city': 'Anytown',
          'zipcode': '12345',
          'geo': {'lat': '37.7749', 'lng': '-122.4194'}
        },
        'website': 'https://example.com',
        'company': {'name': 'ABC Inc.', 'catchPhrase': '', 'bs': ''}
      }
    ];

    final tUserListModel = [
      const UserListModel(
        name: 'John Doe',
        email: 'johndoe@example.com',
        phone: '123-456-7890',
        address: AddressModel(
          street: '123 Main St',
          suite: 'Apt 101',
          city: 'Anytown',
          zipcode: '12345',
          geo: GeoModel(lat: '37.7749', lng: '-122.4194'),
        ),
        website: 'https://example.com',
        company: CompanyModel(name: 'ABC Inc.', catchPhrase: '', bs: ''),
      ),
    ];

    test('should return List<UserListModel> when the call is successful',
        () async {
      // Arrange
      final tUri = Uri.parse('https://jsonplaceholder.typicode.com/users');
      when(mockNetworkConstants.userListEndPoint)
          .thenReturn('https://jsonplaceholder.typicode.com/users');
      when(mockNetworkConstants.getHeadersForLogin())
          .thenReturn({'Content-Type': 'application/json'});
      when(mockClient.get(tUri, headers: anyNamed('headers')))
          .thenAnswer((_) async => tUserListJson);

      // Act
      final result = await dataSource.getUserList();

      // Assert
      expect(result, equals(tUserListModel));
      verify(mockClient.get(tUri, headers: anyNamed('headers')));
    });

    test('should throw an exception when the call fails', () async {
      // Arrange
      final tUri = Uri.parse('https://jsonplaceholder.typicode.com/users');
      when(mockNetworkConstants.userListEndPoint)
          .thenReturn('https://jsonplaceholder.typicode.com/users');
      when(mockNetworkConstants.getHeadersForLogin())
          .thenReturn({'Content-Type': 'application/json'});
      when(mockClient.get(tUri, headers: anyNamed('headers')))
          .thenThrow(isA<HttpException>());

      // Act
      expect(() => dataSource.getUserList(), throwsA(isA<Exception>()));

      // Assert
      verify(mockClient.get(tUri, headers: anyNamed('headers')));
    });
  });
}
