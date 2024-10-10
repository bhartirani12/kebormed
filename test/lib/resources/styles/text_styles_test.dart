// import 'package:flutter_test/flutter_test.dart';
// import 'package:kebormed/resources/resource.dart';
// import 'package:flutter/material.dart';

// void main() {
//   group('TextStyles', () {
//     test('listItemLabelStyle should have correct properties', () {
//       // Act
//       final style = TextStyles.listItemLableStyle;

//       // Assert
//       expect(style.color, Colors.black);
//       expect(style.fontWeight, FontWeight.w500);
//       expect(style.fontSize, 16.0);
//     });

//     test('fieldTitleStyle should have correct properties', () {
//       // Act
//       final style = TextStyles.fieldTitleStyle;

//       // Assert
//       expect(style.color, Colors.black);
//       expect(style.fontWeight, FontWeight.w700);
//       expect(style.fontSize, 16.0);
//     });
//   });
// }

import 'package:flutter/material.dart'; 
import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/resources/styles/text_styles.dart'; // Adjust the import to match your project structure

void main() {
  group('TextStyles', () {
    test('listItemLableStyle should have correct properties', () {
      const textStyle = TextStyles.listItemLableStyle;

      expect(textStyle.color, Colors.black);
      expect(textStyle.fontWeight, FontWeight.w500);
      expect(textStyle.fontSize, 16.0);
    });

    test('fieldTitleStyle should have correct properties', () {
      const textStyle = TextStyles.fieldTitleStyle;

      expect(textStyle.color, Colors.black);
      expect(textStyle.fontWeight, FontWeight.w700);
      expect(textStyle.fontSize, 16.0);
    });
  });

  group('appTextTheme', () {
    testWidgets('should return the correct TextTheme from the context',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                // Call appTextTheme with the BuildContext
                final textTheme = appTextTheme(context);

                // Assertions
                expect(textTheme, isNotNull);
                expect(
                    textTheme.bodyLarge?.fontSize, 16.0); // Example assertion
                return Container();
              },
            ),
          ),
        ),
      );
    });
  });
}
