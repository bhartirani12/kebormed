import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/domain/entities/home_entity.dart';
import 'package:kebormed/features/home/pages/widgets/list_item_widget.dart';
import 'package:kebormed/features/user_detail/pages/user_detail.dart';

void main() {
  testWidgets('ListItemWidget displays user list item',
      (WidgetTester tester) async {
    // Create a test user list entity

    List<UserDataEntity> userList = [
      const UserDataEntity(
        name: 'John Doe',
        email: 'johndoe@example.com',
        phone: '123-456-7890',
        website: 'https://example.com',
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
      const UserDataEntity(
        name: 'Test Test',
        email: 'johndoe1@example.com',
        phone: '123-456-7890s222',
        website: 'https://exampletest.com',
        address: AddressEntity(
          suite: 'Apt 101sdsd',
          street: '123 Main Stsdsd',
          city: 'Anytowdsd',
          zipcode: '12345sdsd',
          geo: GeoEntity(lat: '37.7749sds', lng: '-122.4194sds'),
        ),
        company: CompanyEntity(
          name: 'MP Inc.',
          catchPhrase: '',
          bs: '',
        ),
      )
    ];
    // Build the ListItemWidget with the test user list entity

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children:
              userList.map((user) => ListItemWidget(userList: user)).toList(),
        ),
      ),
    );

    // Verify that the list item widget displays the user's name
    expect(find.text(userList[0].name), findsOneWidget);
    expect(find.text(userList[1].name), findsOneWidget);

    // Verify that the list item widget displays the user's email
    expect(find.text(userList[0].email), findsOneWidget);
    expect(find.text(userList[1].email), findsOneWidget);

    // Verify that tapping on the list item navigates to the UserDetailScreen
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle();
    expect(find.byType(UserDetailScreen), findsOneWidget);
  });
}
