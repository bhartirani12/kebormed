import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/core/network/network_constants.dart';
import 'package:kebormed/core/network/network_info.dart';
import 'package:kebormed/core/network/simple_client.dart';
import 'package:kebormed/core/routes/route.dart';
import 'package:kebormed/core/utils/app_storage.dart';
import 'package:kebormed/core/utils/app_utility.dart';
import 'package:kebormed/data/datasource/home_datasource.dart';
import 'package:kebormed/domain/repositories/home_repository.dart';
import 'package:kebormed/domain/usecases/home_usecase.dart';
import 'package:kebormed/features/home/bloc/bloc.dart';
import 'package:kebormed/features/login/bloc/bloc.dart';
import 'package:kebormed/injection/injection_conatiner.dart';

void main() {
  group('Dependency Injection', () {
    setUpAll(() async {
      await init();
    });

    test('should provide LoginBloc instance', () {
      // Act
      final loginBloc = di<LoginBloc>();

      // Assert
      expect(loginBloc, isNotNull);
    });

    test('should provide HomeScreenBloc instance', () {
      // Act
      final homeScreenBloc = di<HomeScreenBloc>();

      // Assert
      expect(homeScreenBloc, isNotNull);
    });

    test('should provide HomeUsecase instance', () {
      // Act
      final homeUsecase = di<HomeUsecase>();

      // Assert
      expect(homeUsecase, isNotNull);
    });

    test('should provide HomeRepository instance', () {
      // Act
      final homeRepository = di<HomeRepository>();

      // Assert
      expect(homeRepository, isNotNull);
    });

    test('should provide HomeDatasource instance', () {
      // Act
      final homeDatasource = di<HomeDatasource>();

      // Assert
      expect(homeDatasource, isNotNull);
    });

    test('should provide NetworkConstants instance', () {
      // Act
      final networkConstants = di<NetworkConstants>();

      // Assert
      expect(networkConstants, isNotNull);
    });

    test('should provide SimpleClient instance', () {
      // Act
      final simpleClient = di<SimpleClient>();

      // Assert
      expect(simpleClient, isNotNull);
    });

    test('should provide AppUtility instance', () {
      // Act
      final appUtility = di<AppUtility>();

      // Assert
      expect(appUtility, isNotNull);
    });

    test('should provide AppStorage instance', () {
      // Act
      final appStorage = di<AppStorage>();

      // Assert
      expect(appStorage, isNotNull);
    });

    test('should provide NetworkInfo instance', () {
      // Act
      final networkInfo = di<NetworkInfo>();

      // Assert
      expect(networkInfo, isNotNull);
    });

    test('should provide Routes instance', () {
      // Act
      final routes = di<Routes>();

      // Assert
      expect(routes, isNotNull);
    });
  });
}
