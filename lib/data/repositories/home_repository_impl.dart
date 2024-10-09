import 'package:dartz/dartz.dart';
import 'package:kebormed/data/datasource/home_datasource.dart';

import '../../core/error/failure.dart';
import '../../domain/repositories/home_repository.dart';
import '../model/home_model.dart';

/// Repository
class HomeRepositoryImpl extends HomeRepository {
  final HomeDatasource dataSource;

  HomeRepositoryImpl({
    required this.dataSource,
    required super.networkInfo,
  });

  @override
  Future<Either<Failure, List<UserListModel>>> getUserList() async {
    print("await networkInfo.isConnected ${await networkInfo.isConnected}");
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    try {
      var res = await dataSource.getUserList();
      return Right(res);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
