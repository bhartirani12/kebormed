import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/domain/entities/home_entity.dart';

void main() {
  group('UserDataEntity', () {
    test('should be equal when all properties are the same', () {
      // Arrange
      final address = const AddressEntity(
        street: '123 Main St',
        suite: 'Apt 4B',
        city: 'Springfield',
        zipcode: '12345',
        geo: GeoEntity(lat: '40.7128', lng: '74.0060'),
      );
      final company = const CompanyEntity(
        name: 'Tech Corp',
        catchPhrase: 'Innovating the future',
        bs: 'tech solutions',
      );
      final user1 = UserDataEntity(
        name: 'John Doe',
        email: 'johndoe@example.com',
        phone: '123-456-7890',
        address: address,
        website: 'www.johndoe.com',
        company: company,
      );

      final user2 = UserDataEntity(
        name: 'John Doe',
        email: 'johndoe@example.com',
        phone: '123-456-7890',
        address: address,
        website: 'www.johndoe.com',
        company: company,
      );

      // Act & Assert
      expect(user1, user2);
    });
  });

  group('AddressEntity', () {
    test('should be equal when all properties are the same', () {
      // Arrange
      final geo = const GeoEntity(lat: '40.7128', lng: '74.0060');
      final address1 = AddressEntity(
        street: '123 Main St',
        suite: 'Apt 4B',
        city: 'Springfield',
        zipcode: '12345',
        geo: geo,
      );

      final address2 = AddressEntity(
        street: '123 Main St',
        suite: 'Apt 4B',
        city: 'Springfield',
        zipcode: '12345',
        geo: geo,
      );

      // Act & Assert
      expect(address1, address2);
    });
  });

  group('GeoEntity', () {
    test('should be equal when all properties are the same', () {
      // Arrange
      final geo1 = const GeoEntity(lat: '40.7128', lng: '74.0060');
      final geo2 = const GeoEntity(lat: '40.7128', lng: '74.0060');

      // Act & Assert
      expect(geo1, geo2);
    });
  });

  group('CompanyEntity', () {
    test('should be equal when all properties are the same', () {
      // Arrange
      final company1 = const CompanyEntity(
        name: 'Tech Corp',
        catchPhrase: 'Innovating the future',
        bs: 'tech solutions',
      );

      final company2 = const CompanyEntity(
        name: 'Tech Corp',
        catchPhrase: 'Innovating the future',
        bs: 'tech solutions',
      );

      // Act & Assert
      expect(company1, company2);
    });
  });
}
