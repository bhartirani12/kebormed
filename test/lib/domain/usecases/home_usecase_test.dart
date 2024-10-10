import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/core/usecases/no_params.dart';
import 'package:kebormed/domain/entities/home_entity.dart';
import 'package:kebormed/domain/repositories/home_repository.dart';
import 'package:kebormed/domain/usecases/home_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_usecase_test.mocks.dart';

// Annotate HomeRepository only
@GenerateMocks([HomeRepository])
void main() {
  late HomeUsecase usecase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = HomeUsecase(mockHomeRepository);
  });

  final List<UserDataEntity> userData = [
    const UserDataEntity(
      name: '1234',
      email: 'abc',
      phone: '30',
      website: '7262859277',
      address: AddressEntity(
        suite: 'Apt 101',
        street: '123 Main St',
        city: 'Anytown',
        zipcode: '12345',
        geo: GeoEntity(lat: '37.7749', lng: '-122.4194'),
      ),
      company: CompanyEntity(
        name: 'ABC Inc.',
        catchPhrase: '',
        bs: '',
      ),
    ),
  ];

  test(
    'should get list from the repository',
    () async {
      // Arrange: Set up the mock to return the expected data
      when(mockHomeRepository.getUserList())
          .thenAnswer((_) async => Right(userData));

      // Act: Call the use case
      final result = await usecase(NoParams());

      // Assert: Check that the result matches the expected data
      expect(result, Right(userData));
      verify(mockHomeRepository.getUserList());
      verifyNoMoreInteractions(mockHomeRepository);
    },
  );
}
