import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:kebormed/features/login/bloc/bloc.dart';
import 'package:kebormed/features/login/pages/login.dart';
import 'package:kebormed/resources/resource.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockLoginBloc extends Mock implements LoginBloc {}

void main() {
  late MockLoginBloc mockLoginBloc;

  setUp(() {
    mockLoginBloc = MockLoginBloc();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<LoginBloc>(
        create: (_) => mockLoginBloc,
        child: const LoginScreen(),
      ),
    );
  }

  testWidgets('Login screen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byKey(WidgetKeys.loginButton), findsOneWidget);
    expect(find.byKey(WidgetKeys.loginUsername), findsOneWidget);
    expect(find.byKey(WidgetKeys.loginPassword), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);
  });

  testWidgets('Login button triggers validation', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final loginButton = find.byKey(WidgetKeys.loginButton);

    // Tap the login button
    await tester.tap(loginButton);
    await tester.pump();

    // Verify the validation function is called
    verify(mockLoginBloc.formKey.currentState?.validate()).called(1);
  });

  testWidgets('Remember me checkbox works', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final rememberMeCheckbox = find.byType(Checkbox);

    // Initially unchecked
    expect(mockLoginBloc.isRemembered, false);

    // Tap the checkbox
    await tester.tap(rememberMeCheckbox);
    await tester.pump();

    expect(mockLoginBloc.isRemembered, true);
  });
}
