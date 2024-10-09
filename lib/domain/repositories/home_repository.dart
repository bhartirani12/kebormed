import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/network/network_info.dart';
import '../../data/model/home_model.dart';

/// Abstract repository for Home
abstract class HomeRepository {
  final NetworkInfo networkInfo;

  HomeRepository({
    required this.networkInfo,
  });
  Future<Either<Failure, List<UserListModel>>> getUserList();
}
