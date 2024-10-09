import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:kebormed/core/utils/app_storage.dart';
import 'package:kebormed/core/utils/app_utility.dart';
import 'package:kebormed/features/home/bloc/bloc.dart';
import 'package:kebormed/features/login/bloc/login_bloc.dart';
import 'package:kebormed/features/login/pages/login.dart';
import 'package:kebormed/resources/widget_keys.dart';
import 'package:mockito/mockito.dart';

// Create a mock class for LoginBloc
class MockLoginBloc extends Mock implements LoginBloc {}

class MockAppStorage extends Mock implements AppStorage {}

class MockAppUtility extends Mock implements AppUtility {}

class MockHomeBloc extends Mock implements HomeScreenBloc {}

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    // Register the LoginBloc with GetIt before tests

    GetIt.I.registerSingleton<LoginBloc>(
        LoginBloc(appStorage: MockAppStorage(), appUtility: MockAppUtility()));
  });
  testWidgets('LoginScreen should render username and password fields',
      (WidgetTester tester) async {
    // Build the LoginScreen widget
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // Check if the username field is present
    expect(find.byKey(WidgetKeys.loginUsername), findsOneWidget);

    // Check if the password field is present
    expect(find.byKey(WidgetKeys.loginPassword), findsOneWidget);

    // Check if the "Remember Me" checkbox is present
    expect(find.byType(Checkbox), findsOneWidget);
  });

  testWidgets('Toggling the "Remember Me" checkbox changes its value',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));
    // Verify the checkbox is initially unchecked
    Checkbox checkbox = tester.widget(find.byType(Checkbox));
    expect(checkbox.value, false);

    // Tap on the checkbox to change its value
    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    // Verify the checkbox is now checked
    checkbox = tester.widget(find.byType(Checkbox));
    expect(checkbox.value, true);
  });
}
