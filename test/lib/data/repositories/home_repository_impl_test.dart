import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/core/network/network_info.dart';
import 'package:kebormed/data/model/home_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:kebormed/data/datasource/home_datasource.dart';
import 'package:kebormed/data/repositories/home_repository_impl.dart';
import 'package:kebormed/core/error/failure.dart';

import 'home_repository_impl_test.mocks.dart';

@GenerateMocks([NetworkInfo, HomeDatasource])
void main() {
  late HomeRepositoryImpl repository;
  late MockHomeDatasource mockHomeDatasource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockHomeDatasource = MockHomeDatasource();
    mockNetworkInfo = MockNetworkInfo();
    repository = HomeRepositoryImpl(
      dataSource: mockHomeDatasource,
      networkInfo: mockNetworkInfo,
    );
  });

  const userList = [
    UserListModel(
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

  group('getUserList', () {
    test('should return NetworkFailure when there is no internet connection',
        () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      // act
      final result = await repository.getUserList();

      // assert
      expect(result, Left(NetworkFailure()));
      verify(mockNetworkInfo.isConnected);
      verifyNoMoreInteractions(mockHomeDatasource);
    });

    test(
        'should return list of UserListModel when call to datasource is successful',
        () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockHomeDatasource.getUserList()).thenAnswer((_) async => userList);

      // act
      final result = await repository.getUserList();

      // assert
      expect(result, const Right(userList));
      verify(mockNetworkInfo.isConnected);
      verify(mockHomeDatasource.getUserList());
    });

    test('should return ServerFailure when datasource throws an exception',
        () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockHomeDatasource.getUserList()).thenThrow(Exception());

      // act
      final result = await repository.getUserList();

      // assert
      expect(result, Left(ServerFailure()));
      verify(mockNetworkInfo.isConnected);
      verify(mockHomeDatasource.getUserList());
    });
  });
}
