import 'package:get_it/get_it.dart';
import 'package:kebormed/core/utils/app_storage.dart';
import 'package:kebormed/core/utils/app_utility.dart';
import 'package:kebormed/data/datasource/home_datasource.dart';
import 'package:kebormed/data/repositories/home_repository_impl.dart';
import 'package:kebormed/domain/repositories/home_repository.dart';
import 'package:kebormed/domain/usecases/home_usecase.dart';
import 'package:kebormed/features/home/bloc/home_bloc.dart';
import 'package:kebormed/features/user_detail/bloc/bloc.dart';

import '../core/network/network_constants.dart';
import '../core/network/network_info.dart';
import '../core/network/simple_client.dart';
import '../features/login/bloc/login_bloc.dart';
import '../core/routes/route.dart';

// Setting 'di' naming from dependency injection
final di = GetIt.instance;

Future<void> init() async {
  // BLoC
  di.registerFactory(
    () => LoginBloc(),
  );
  di.registerFactory(
    () => HomeScreenBloc(
      homeUsecase: di(),
    ),
  );
  di.registerFactory(
    () => UserDetailScreenBloc(),
  );

  // UseCase
  di.registerLazySingleton(
    () => HomeUsecase(
      di(),
    ),
  );

  // Repository
  di.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      dataSource: di(),
      networkInfo: di(),
    ),
  );

  // Datasource
  di.registerLazySingleton(
    () => HomeDatasource(
      di(),
      di(),
    ),
  );

  // Common
  di.registerLazySingleton<NetworkConstants>(
    () => NetworkConstants(),
  );
  di.registerLazySingleton(
    () => SimpleClient(),
  );
  di.registerLazySingleton(
    () => AppUtility(),
  );
  di.registerLazySingleton(
    () => AppStorage(),
  );
  di.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(),
  );
  di.registerLazySingleton(() => Routes());
}
