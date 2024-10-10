import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/core/utils/app_storage.dart'; // Adjust import based on your file structure
import 'package:kebormed/core/utils/app_utility.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AppStorage', () {
    late AppStorage appStorage;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});

      appStorage = AppStorage();
      await AppStorage.initializePrefs();
    });

    test('should save and retrieve credentials', () async {
      // Arrange
      final username = 'test_username';
      final password = 'test_password';
      final isRemember = true;
      final token = 'test_token';

      // Act
      await appStorage.saveCredentials(username, password, isRemember, token);

      // Assert
      expect(appStorage.getUsername(), username);
      expect(appStorage.getPassword(), password);
      expect(appStorage.getRememberMe(), isRemember);
      expect(appStorage.getToken(), token);
    });

    test('should clear credentials', () async {
      // Arrange
      await appStorage.clearCredentials();

      // Assert
      expect(appStorage.getUsername(), null);
      expect(appStorage.getPassword(), null);
      expect(appStorage.getRememberMe(), null);
      expect(appStorage.getToken(), null);
    });
  });

  group('AppUtility', () {
    late AppUtility appUtility;

    setUpAll(() {
      appUtility = AppUtility();
    });

    test('should generate a random key', () {
      // Act
      final key = appUtility.generateRandomKey(16);

      // Assert
      expect(key, isNotNull);
      expect(key.length, 24);
    });

    test('should generate an HMAC token', () {
      // Arrange
      final secret = 'test_secret';
      final data = 'test_data';

      // Act
      final token = appUtility.generateHMACToken(secret, data);

      // Assert
      expect(token, isNotNull);
    });

    test('should throw an error for empty secret or data', () {
      // Arrange
      final secret = '';
      final data = '';

      // Act and Assert
      expect(() => appUtility.generateHMACToken(secret, data),
          throwsArgumentError);
    });
  });
}
