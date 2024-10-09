import 'package:dartz/dartz.dart';
import 'package:kebormed/domain/repositories/home_repository.dart';
import '../../core/error/failure.dart';
import '../../core/usecases/no_params.dart';
import '../../core/usecases/usecase.dart';
import '../../data/model/home_model.dart';

class HomeUsecase extends UseCase<List<UserListModel>, NoParams> {
  final HomeRepository _repository;

  HomeUsecase(
    this._repository,
  );

  @override
  Future<Either<Failure, List<UserListModel>>> call(
    NoParams params,
  ) async {
    var result = await _repository.getUserList();
    return result;
  }
}
