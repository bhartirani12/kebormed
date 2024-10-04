import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/features/splash/splash.dart';
import 'package:mockito/mockito.dart'; // Ensure your app's entry point is imported

// You can generate this using mockito if needed.
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('SplashScreen navigates to Login after 2 seconds',
      (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(MaterialApp(
      home: const SplashScreen(),
      navigatorObservers: [mockObserver],
      routes: {
        '/login': (context) => const Scaffold(body: Text('Login Screen')),
      },
    ));

    // Verify if the splash screen text is displayed initially
    expect(find.text('Kebormed'), findsOneWidget);

    // Wait for 2 seconds + extra time to ensure timer completes
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('Login Screen'), findsOneWidget);
  });
}
