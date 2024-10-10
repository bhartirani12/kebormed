import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/resources/resource.dart';
import 'package:flutter/material.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('AppLocalizations', () {
    test('should return a valid AppLocalizations instance', () {
      // Act
      final localizations = AppLocalizations(const Locale('en'));

      // Assert
      expect(localizations, isNotNull);
    });

    test('should load localized strings successfully', () async {
      // Act
      final localizations = AppLocalizations(const Locale('en'));
      final loaded = await localizations.load();

      // Assert
      expect(loaded, isTrue);
    });

    test('should translate a string correctly', () async {
      // Arrange
      final localizations = AppLocalizations(const Locale('en'));
      final loaded = await localizations.load();

      // Act
      String? translated;
      if (loaded) {
        translated = localizations.translate('title');
      }

      // Assert
      expect(translated, isNotNull);
    });
  });

  group('ImageKeys', () {
    test('logoImage should be a valid asset path', () {
      // Act
      final imagePath = ImageKeys.logoImage;

      // Assert
      expect(imagePath, 'assets/images/logo.svg');
    });
  });

  group('MarginKeys', () {
    test('inputFieldVerticalMargin should be a valid margin value', () {
      // Act
      final margin = MarginKeys.inputFieldVerticalMargin;

      // Assert
      expect(margin, 14.0);
    });

    test('bodyCommonVerticalMargin should be a valid margin value', () {
      // Act
      final margin = MarginKeys.bodyCommonVerticalMargin;

      // Assert
      expect(margin, 10.0);
    });
  });

  group('BorderSideKeys', () {
    test('inputFieldBorderWidth should be a valid border width value', () {
      // Act
      final borderWidth = BorderSideKeys.inputFieldBorderWidth;

      // Assert
      expect(borderWidth, 0.6);
    });
  });

  group('AppBorderRadius', () {
    test('commonButtonRadius should be a valid border radius', () {
      // Act
      final borderRadius = AppBorderRadius.commonButtonRadius;

      // Assert
      expect(borderRadius, const BorderRadius.all(Radius.circular(5)));
    });
  });

  group('StringKeys', () {
    test('title should be a valid string key', () {
      // Act
      final key = StringKeys.title;

      // Assert
      expect(key, 'title');
    });
  });

  group('WidgetKeys', () {
    test('loginUsername should be a valid key', () {
      // Act
      final key = WidgetKeys.loginUsername;

      // Assert
      expect(key, const Key('loginUsername'));
    });
  });
}
