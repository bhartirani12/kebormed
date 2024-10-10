import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/data/model/home_model.dart';
import 'package:kebormed/features/home/bloc/home_bloc.dart';
import 'package:kebormed/features/home/bloc/home_event.dart';
import 'package:kebormed/features/home/bloc/home_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:kebormed/core/error/failure.dart';
import 'package:kebormed/core/usecases/no_params.dart';
import 'package:kebormed/domain/usecases/home_usecase.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([HomeUsecase])
void main() {
  late HomeScreenBloc homeScreenBloc;
  late MockHomeUsecase mockHomeUsecase;

  setUp(() {
    mockHomeUsecase = MockHomeUsecase();
    homeScreenBloc = HomeScreenBloc(homeUsecase: mockHomeUsecase);
  });

  tearDown(() {
    homeScreenBloc.close();
  });

  test('initial state should be EmptyState', () {
    expect(homeScreenBloc.state, const EmptyState());
  });
  test(
      'should emit LoadingState and then ApiSuccessState when data is fetched successfully',
      () async {
    // Arrange
    final userList = [
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

    when(mockHomeUsecase.call(NoParams()))
        .thenAnswer((_) async => Right(userList));

    // Act
    final result = await mockHomeUsecase.call(NoParams());

    // Assert
    expect(result, Right(userList));
    // Assert that the LoadingState is emitted
    final expectedStates = [
      const LoadingState(),
      ApiSuccessState(),
    ];

    expectLater(homeScreenBloc.stream, emitsInOrder(expectedStates));

    // Act
    homeScreenBloc.add(const FetchHomeScreenListEvent());
  });

  test('should emit NoInternetState when there is a NetworkFailure', () async {
    // Arrange
    when(mockHomeUsecase.call(NoParams())).thenAnswer(
      (_) async => Left(NetworkFailure()),
    );

    // Assert that the LoadingState is emitted followed by NoInternetState
    final expectedStates = [
      const LoadingState(),
      NoInternetState(),
    ];

    expectLater(homeScreenBloc.stream, emitsInOrder(expectedStates));

    // Act
    homeScreenBloc.add(const FetchHomeScreenListEvent());
  });

  test('should emit ApiFailureState when there is an API failure', () async {
    // Arrange
    when(mockHomeUsecase.call(NoParams())).thenAnswer(
      (_) async => Left(ServerFailure()),
    );

    // Assert that the LoadingState is emitted followed by ApiFailureState
    final expectedStates = [
      const LoadingState(),
      const ApiFailureState(),
    ];

    expectLater(homeScreenBloc.stream, emitsInOrder(expectedStates));

    // Act
    homeScreenBloc.add(const FetchHomeScreenListEvent());
  });

  test('should emit LoadingState on pull-to-refresh', () async {
    // Arrange
    final userList = [
      const UserListModel(
        name: 'Jane Doe',
        email: 'janedoe@example.com',
        phone: '123-456-7891',
        address: AddressModel(
          street: '456 Main St',
          suite: 'Apt 202',
          city: 'Anytown',
          zipcode: '12346',
          geo: GeoModel(lat: '37.7749', lng: '-122.4194'),
        ),
        website: 'https://example.com',
        company: CompanyModel(name: 'XYZ Inc.', catchPhrase: '', bs: ''),
      ),
    ];

    when(mockHomeUsecase.call(NoParams()))
        .thenAnswer((_) async => Right(userList));

    // Assert that the LoadingState is emitted when pulling to refresh
    expectLater(
        homeScreenBloc.stream,
        emitsInOrder([
          const LoadingState(),
          ApiSuccessState(),
        ]));

    // Act
    await homeScreenBloc.onRefresh();
  });
}
