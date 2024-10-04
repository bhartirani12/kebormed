import 'package:get_it/get_it.dart';

import '../core/constants/app_constant.dart';
import '../core/network/network_constants.dart';
import '../core/network/network_info.dart';
import '../core/network/simple_client.dart';

// Setting 'di' naming from dependency injection
final di = GetIt.instance;

Future<void> init() async {
  // BLoC

  // UseCase

  // Repository

  // Datasource

  // Common
  di.registerLazySingleton<NetworkConstants>(
    () => NetworkConstants(),
  );
  di.registerLazySingleton(
    () => SimpleClient(),
  );
  di.registerLazySingleton(
    () => AppConstants(),
  );
  di.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(),
  );
}
