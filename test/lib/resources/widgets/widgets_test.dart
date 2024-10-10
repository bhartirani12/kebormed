import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/resources/resource.dart';

void main() {
  testWidgets('ProgressLoader displays child widget',
      (WidgetTester tester) async {
    final testWidget = const MaterialApp(
      home: ProgressLoader(
        inAsyncCall: false,
        child: Text('Hello, World!'),
      ),
    );

    await tester.pumpWidget(testWidget);
    expect(find.text('Hello, World!'), findsOneWidget);
  });

  testWidgets(
      'ProgressLoader displays loading indicator when inAsyncCall is true',
      (WidgetTester tester) async {
    final testWidget = const MaterialApp(
      home: ProgressLoader(
        inAsyncCall: true,
        child: Text('Hello, World!'),
      ),
    );
    await tester.pumpWidget(testWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('CommonContainer renders child widget and applies styles',
      (WidgetTester tester) async {
    final testChild = const Text('Test Child');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommonContainer(child: testChild),
        ),
      ),
    );

    expect(find.text('Test Child'), findsOneWidget);
    expect(find.byType(CommonContainer), findsOneWidget);
    final containerFinder = find.byType(Container).first;
    final containerWidget = tester.widget<Container>(containerFinder);
    expect(containerWidget.padding,
        const EdgeInsets.all(MarginKeys.commonPadding));
    expect(containerWidget.margin,
        const EdgeInsets.all(MarginKeys.dialogBoxContentMargin));
    final decoration = containerWidget.decoration as BoxDecoration;
    expect(decoration.color, Colors.white);
    expect(decoration.borderRadius,
        BorderRadius.circular(MarginKeys.bodyCommonVerticalMargin));
    expect(decoration.boxShadow?.length, 1);
    expect(decoration.boxShadow?[0].color, Colors.black12);
    expect(
        decoration.boxShadow?[0].blurRadius, MarginKeys.dialogBoxContentMargin);
    expect(
        decoration.boxShadow?[0].spreadRadius, MarginKeys.commonSpreadRadius);
  });

  testWidgets('CommonButton displays label and responds to taps',
      (WidgetTester tester) async {
    // Define a test label and a callback
    const testLabel = 'Click Me';
    bool isPressed = false;
    void onPressed() {
      isPressed = true;
    }

    // Build the CommonButton widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommonButton(
            label: testLabel,
            onPressed: onPressed,
          ),
        ),
      ),
    );

    // Verify that the button displays the correct label
    expect(find.text(testLabel), findsOneWidget);

    // Verify that the button has the expected styling
    final buttonFinder = find.byType(CommonButton);
    expect(buttonFinder, findsOneWidget);

    // Check the underlying Container for specific properties
    final containerFinder = find.byType(Container).first;
    final containerWidget = tester.widget<Container>(containerFinder);

    // Get the context using tester's current context
    final context = tester.element(containerFinder);

    // Check if the decoration is applied correctly
    final decoration = containerWidget.decoration as BoxDecoration;
    expect(decoration.color, Theme.of(context).colorScheme.primary);
    expect(decoration.borderRadius, AppBorderRadius.commonButtonRadius);

    // Simulate a tap on the button
    await tester.tap(find.text(testLabel));
    await tester.pumpAndSettle(); // Wait for animations to complete

    // Verify that the onPressed callback was called
    expect(isPressed, true);
  });
}
