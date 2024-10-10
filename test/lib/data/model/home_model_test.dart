// import 'package:flutter_test/flutter_test.dart';
// import 'package:kebormed/data/model/home_model.dart';
// import 'package:kebormed/domain/entities/home_entity.dart';

// void main() {
//   final userListModel = const UserListModel(
//     name: 'John Doe',
//     email: 'johndoe@example.com',
//     phone: '123-456-7890',
//     website: 'https://example.com',
//     address: AddressModel(
//       suite: 'Apt 101',
//       street: '123 Main St',
//       city: 'Anytown',
//       zipcode: '12345',
//       geo: GeoModel(lat: '37.7749', lng: '-122.4194'),
//     ),
//     company: CompanyModel(
//       name: 'ABC Inc.',
//       catchPhrase: '',
//       bs: '',
//     ),
//   );
//   test(
//     'should be a subclass of UserDataEntity',
//     () async {
//       expect(userListModel, isA<UserDataEntity>());
//     },
//   );
// }

import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/data/model/home_model.dart';

void main() {
  group('UserListModel', () {
    test('should correctly parse JSON into UserListModel', () {
      // Arrange
      final json = {
        'name': 'John Doe',
        'email': 'john.doe@example.com',
        'phone': '123-456-7890',
        'address': {
          'street': '123 Main St',
          'suite': 'Apt 4',
          'city': 'Metropolis',
          'zipcode': '12345',
          'geo': {
            'lat': '40.7128',
            'lng': '74.0060',
          },
        },
        'website': 'johndoe.com',
        'company': {
          'name': 'Doe Industries',
          'catchPhrase': 'Innovation for the Future',
          'bs': 'business solutions',
        },
      };

      // Act
      final result = UserListModel.fromJson(json);

      // Assert
      expect(result, isA<UserListModel>());
      expect(result.name, 'John Doe');
      expect(result.email, 'john.doe@example.com');
      expect(result.phone, '123-456-7890');
      expect(result.address.street, '123 Main St');
      expect(result.address.suite, 'Apt 4');
      expect(result.address.city, 'Metropolis');
      expect(result.address.zipcode, '12345');
      expect(result.address.geo.lat, '40.7128');
      expect(result.address.geo.lng, '74.0060');
      expect(result.website, 'johndoe.com');
      expect(result.company.name, 'Doe Industries');
      expect(result.company.catchPhrase, 'Innovation for the Future');
      expect(result.company.bs, 'business solutions');
    });
  });

  group('AddressModel', () {
    test('should correctly parse JSON into AddressModel', () {
      // Arrange
      final json = {
        'street': '123 Main St',
        'suite': 'Apt 4',
        'city': 'Metropolis',
        'zipcode': '12345',
        'geo': {
          'lat': '40.7128',
          'lng': '74.0060',
        },
      };

      // Act
      final result = AddressModel.fromJson(json);

      // Assert
      expect(result, isA<AddressModel>());
      expect(result.street, '123 Main St');
      expect(result.suite, 'Apt 4');
      expect(result.city, 'Metropolis');
      expect(result.zipcode, '12345');
      expect(result.geo.lat, '40.7128');
      expect(result.geo.lng, '74.0060');
    });
  });

  group('GeoModel', () {
    test('should correctly parse JSON into GeoModel', () {
      // Arrange
      final json = {
        'lat': '40.7128',
        'lng': '74.0060',
      };

      // Act
      final result = GeoModel.fromJson(json);

      // Assert
      expect(result, isA<GeoModel>());
      expect(result.lat, '40.7128');
      expect(result.lng, '74.0060');
    });
  });

  group('CompanyModel', () {
    test('should correctly parse JSON into CompanyModel', () {
      // Arrange
      final json = {
        'name': 'Doe Industries',
        'catchPhrase': 'Innovation for the Future',
        'bs': 'business solutions',
      };

      // Act
      final result = CompanyModel.fromJson(json);

      // Assert
      expect(result, isA<CompanyModel>());
      expect(result.name, 'Doe Industries');
      expect(result.catchPhrase, 'Innovation for the Future');
      expect(result.bs, 'business solutions');
    });
  });
}
