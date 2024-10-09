import 'package:dartz/dartz.dart';
import 'package:kebormed/domain/repositories/home_repository.dart';
import '../../core/error/failure.dart';
import '../../core/usecases/no_params.dart';
import '../../core/usecases/usecase.dart';
import '../entities/home_entity.dart';

class HomeUsecase extends UseCase<List<UserDataEntity>, NoParams> {
  final HomeRepository _repository;

  HomeUsecase(
    this._repository,
  );

  @override
  Future<Either<Failure, List<UserDataEntity>>> call(
    NoParams params,
  ) async {
    var result = await _repository.getUserList();
    return result;
  }
}
