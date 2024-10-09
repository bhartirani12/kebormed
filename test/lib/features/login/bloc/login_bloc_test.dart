import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/core/utils/app_storage.dart';
import 'package:kebormed/core/utils/app_utility.dart';
import 'package:kebormed/features/login/bloc/login_bloc.dart';
import 'package:kebormed/features/login/bloc/login_state.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter/material.dart';
// Make sure the path is correct for your case

// Mock classes
class MockAppStorage extends Mock implements AppStorage {}

class MockAppUtility extends Mock implements AppUtility {}

class MockBuildContext extends Mock implements BuildContext {
  @override
  bool get mounted => true; // Return true for mounted property
}

@GenerateMocks([AppStorage, AppUtility, MockBuildContext])
void main() {
  late MockAppStorage mockAppStorage;
  late MockAppUtility mockAppUtility;
  late LoginBloc loginBloc;

  setUp(() {
    mockAppStorage = MockAppStorage();
    mockAppUtility = MockAppUtility();
    loginBloc =
        LoginBloc(appStorage: mockAppStorage, appUtility: mockAppUtility);
  });

  tearDown(() {
    loginBloc.close();
  });

  group('LoginBloc Tests', () {
    test('Initial state should be EmptyState', () {
      expect(loginBloc.state, const EmptyState());
    });
    test('Load user credentials does not populate when values are null', () {
      // Arrange
      when(mockAppStorage.getUsername()).thenReturn(null);
      when(mockAppStorage.getPassword()).thenReturn(null);
      when(mockAppStorage.getRememberMe()).thenReturn(null);

      // Act
      loginBloc.loadUserCredentials();

      // Assert
      expect(loginBloc.userNameController.text, '');
      expect(loginBloc.passwordController.text, '');
      expect(loginBloc.isRemembered, false); // Default value for isRemembered
    });

/*    test('Load user credentials populates controllers when remembers the state ', ()  {

      when(mockAppStorage.getUsername()).thenAnswer((_)  => 'test_user');
      when(mockAppStorage.getPassword()).thenAnswer((_)  => 'test_pass');
      when(mockAppStorage.getRememberMe()).thenAnswer((_)  => true);


     //  loginBloc.loadUserCredentials();

   */ /*   expect(loginBloc.userNameController.text, 'test_user');
      expect(loginBloc.passwordController.text, 'test_pass');*/ /*
      expect(loginBloc.isRemembered, true);
    });*/

/*    test('Save user credentials when remember me is true', () async {
      loginBloc.isRemembered = true;
      loginBloc.userNameController.text = 'test_user';
      loginBloc.passwordController.text = 'test_pass';

      when(mockAppUtility.generateRandomKey(32)).thenReturn('random_key');
      when(mockAppUtility.generateHMACToken('random_key', 'data'))
          .thenReturn('generated_token');

       loginBloc.saveUserCredentials(MockBuildContext());

      verify(mockAppStorage.saveCredentials('test_user', 'test_pass', true,
          'generated_token')).called(1);
    });*/

    /* test('Clear credentials when remember me is false', () async {
      loginBloc.isRemembered = false;

      await loginBloc.saveUserCredentials(context);

      verify(mockAppStorage.clearCredentials()).called(1);
    });*/

    test('Generate token works correctly', () async {
      when(mockAppUtility.generateRandomKey(32)).thenReturn('random_key');
      when(mockAppUtility.generateHMACToken('random_key', 'username|password'))
          .thenReturn('generated_token');

      loginBloc.userNameController.text = 'test_user';
      loginBloc.passwordController.text = 'test_pass';

      loginBloc.generateToken();

      expect(loginBloc.token, 'generated_token');
    });
  });
}
