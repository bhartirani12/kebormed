import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF01AB4F),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF74FF6C),
  onPrimaryContainer: Color(0xFFA6E2B2),
  secondary: Color(0xFF0d6efd),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD9E2FF),
  onSecondaryContainer: Color(0xFF001945),
  tertiary: Color(0xFFABDFB5),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF9BF6B3),
  onTertiaryContainer: Color(0xFF00210D),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  surface: Color(0xFFedf5fb),
  onSurface: Color(0xFF1D1D1D),
  surfaceContainerHighest: Color(0xFFDEE4D8),
  onSurfaceVariant: Color(0xFF42493F),
  outline: Color(0xFF73796E),
  onInverseSurface: Color(0xFFD0F8FF),
  inverseSurface: Color(0xFF00363D),
  inversePrimary: Color(0xFFCDCDCD),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF5A5A5A),
  outlineVariant: Color(0xFFC2C8BC),
  scrim: Color(0xFF29166F),
);

void main() {
  group('LightColorScheme Tests', () {
    test('Primary color is correct', () {
      expect(lightColorScheme.primary, const Color(0xFF01AB4F));
    });

    test('On Primary color is correct', () {
      expect(lightColorScheme.onPrimary, const Color(0xFFFFFFFF));
    });

    test('Primary Container color is correct', () {
      expect(lightColorScheme.primaryContainer, const Color(0xFF74FF6C));
    });

    test('On Primary Container color is correct', () {
      expect(lightColorScheme.onPrimaryContainer, const Color(0xFFA6E2B2));
    });

    test('Secondary color is correct', () {
      expect(lightColorScheme.secondary, const Color(0xFF0d6efd));
    });

    test('On Secondary color is correct', () {
      expect(lightColorScheme.onSecondary, const Color(0xFFFFFFFF));
    });

    test('Surface color is correct', () {
      expect(lightColorScheme.surface, const Color(0xFFedf5fb));
    });

    test('On Surface color is correct', () {
      expect(lightColorScheme.onSurface, const Color(0xFF1D1D1D));
    });

    test('Error color is correct', () {
      expect(lightColorScheme.error, const Color(0xFFBA1A1A));
    });

    // Add more tests for other colors in the ColorScheme
    // ...
  });
}
