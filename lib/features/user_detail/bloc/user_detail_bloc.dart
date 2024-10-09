import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebormed/domain/entities/home_entity.dart';
import 'bloc.dart';

class UserDetailScreenBloc
    extends Bloc<UserDetailScreenEvent, UserDetailScreenState> {
  List<UserDataEntity> fullUserList = [];

  UserDetailScreenBloc() : super(const EmptyState());

  @override
  Future<void> onEvent(UserDetailScreenEvent event) async {
    super.onEvent(event);
  }
}
