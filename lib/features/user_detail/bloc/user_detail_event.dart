import 'package:equatable/equatable.dart';

abstract class UserDetailScreenEvent extends Equatable {
  const UserDetailScreenEvent();
}

class NoInternetEvent extends UserDetailScreenEvent {
  @override
  List<Object> get props => [];
}
