import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/domain/entities/home_entity.dart';
import 'package:kebormed/features/user_detail/pages/user_detail.dart';

void main() {
  testWidgets('User DetailScreen displays user details',
      (WidgetTester tester) async {
    // Create a test user detail entity
    final userDetail = const UserDataEntity(
      name: 'John Doe',
      email: 'johndoe@example.com',
      phone: '123-456-7890',
      website: 'https://example.com',
      address: AddressEntity(
        suite: 'Apt 101',
        street: '123 Main St',
        city: 'Anytown',
        zipcode: '12345',
        geo: GeoEntity(lat: "37.7749", lng: "-122.4194"),
      ),
      company: CompanyEntity(
        name: 'ABC Inc.',
        catchPhrase: '',
        bs: '',
      ),
    );

    // Build the UserDetailScreen with the test user detail entity
    await tester.pumpWidget(
      MaterialApp(
        home: UserDetailScreen(userDetail: userDetail),
      ),
    );

    // Verify that the user detail screen displays the user's name
    expect(find.text(userDetail.name), findsOneWidget);

    // Verify that the user detail screen displays the user's email
    expect(find.text(userDetail.email), findsOneWidget);

    // Verify that the user detail screen displays the user's phone number
    expect(find.text(userDetail.phone), findsOneWidget);

    // Verify that the user detail screen displays the user's website
    expect(find.text(userDetail.website), findsOneWidget);

    // Verify that the user detail screen displays the user's address
    expect(
        find.text(
            '${userDetail.address.suite} - ${userDetail.address.street}, ${userDetail.address.city} (${userDetail.address.zipcode})'),
        findsOneWidget);

    // Verify that the user detail screen displays the user's geo coordinates
    expect(find.text(userDetail.company.name), findsOneWidget);
  });
}
