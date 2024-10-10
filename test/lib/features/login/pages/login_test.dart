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
  late LoginBloc loginBloc;
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    loginBloc =
        LoginBloc(appStorage: MockAppStorage(), appUtility: MockAppUtility());
    GetIt.I.registerSingleton<LoginBloc>(
        LoginBloc(appStorage: MockAppStorage(), appUtility: MockAppUtility()));
  });
  testWidgets('LoginScreen should render username and password fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));
    expect(find.byKey(WidgetKeys.loginUsername), findsOneWidget);
    expect(find.byKey(WidgetKeys.loginPassword), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);
  });

  testWidgets('Toggling the "Remember Me" checkbox changes its value',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));
    Checkbox checkbox = tester.widget(find.byType(Checkbox));
    expect(checkbox.value, false);
    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    checkbox = tester.widget(find.byType(Checkbox));
    expect(checkbox.value, true);
  });

  testWidgets('Submitting form validates input', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    expect(find.byKey(WidgetKeys.loginButton), findsOneWidget);

    await tester.enterText(
        find.byKey(WidgetKeys.loginCustomUserName), 'test@gmail.com');
    await tester.enterText(
        find.byKey(WidgetKeys.loginCustomPassword), '1111111');
    await tester.tap(find.byKey(WidgetKeys.loginButton));
    await tester.pump();
    final formKey = loginBloc.formKey;
    final isValid = formKey.currentState?.validate() ?? false;
    expect(isValid, true);
    await tester.enterText(find.byKey(WidgetKeys.loginCustomUserName), 'test');
    await tester.enterText(find.byKey(WidgetKeys.loginCustomPassword), '11');
    await tester.tap(find.byKey(WidgetKeys.loginButton));
    await tester.pump();
    final isValidFailed = formKey.currentState?.validate() ?? false;
    expect(isValidFailed, false);
  });
}
