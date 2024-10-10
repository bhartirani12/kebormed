import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/core/utils/app_storage.dart';
import 'package:kebormed/core/utils/app_utility.dart';
import 'package:kebormed/features/login/bloc/login_bloc.dart';
import 'package:kebormed/features/login/bloc/login_state.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter/material.dart';

class MockAppStorage extends Mock implements AppStorage {}

class MockAppUtility extends Mock implements AppUtility {}

class MockBuildContext extends Mock implements BuildContext {
  @override
  bool get mounted => true;
}

@GenerateMocks([MockAppStorage, MockAppUtility, MockBuildContext])
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
      when(mockAppStorage.getUsername()).thenReturn(null);
      when(mockAppStorage.getPassword()).thenReturn(null);
      when(mockAppStorage.getRememberMe()).thenReturn(null);
      loginBloc.loadUserCredentials();
      expect(loginBloc.userNameController.text, '');
      expect(loginBloc.passwordController.text, '');
      expect(loginBloc.isRemembered, false);
    });

    test('Load user credentials   populate when values are fill', () {
      when(mockAppStorage.getUsername()).thenReturn('test user');
      when(mockAppStorage.getPassword()).thenReturn('test password');
      when(mockAppStorage.getRememberMe()).thenReturn(true);
      loginBloc.loadUserCredentials();
      expect(loginBloc.userNameController.text, 'test user');
      expect(loginBloc.passwordController.text, 'test password');
      expect(loginBloc.isRemembered, true);
    });
  });
}
